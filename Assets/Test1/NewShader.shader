Shader "Custom/TexShader" {

Properties {
	_MainTex ("Base (RGBA)", 2D) = "white" {}
}

SubShader {
Tags { "Queue"="Transparent" }

Blend SrcAlpha OneMinusSrcAlpha
Lighting Off 
Cull Off

CGINCLUDE	
#include "UnityCG.cginc"

struct v2f {
half4 pos	 : SV_POSITION;
fixed4 color : COLOR;
fixed2 uv	 : TEXCOORD0;
};

sampler2D _MainTex;
float4 _MainTex_ST;

v2f vert (appdata_full v)
{
v2f o;

o.uv = TRANSFORM_TEX(v.texcoord, _MainTex);

float4 pos4 = o.pos = mul(UNITY_MATRIX_MVP, v.vertex);

pos4 += _SinTime * 0.05;

o.pos =pos4;

o.color	= v.color;	
return o;
}
ENDCG

Pass {
CGPROGRAM
#pragma vertex vert
#pragma fragment frag
#pragma fragmentoption ARB_precision_hint_fastest	
fixed4 frag (v2f IN) : COLOR
{	
fixed4 c = tex2D (_MainTex, IN.uv.xy) * IN.color;
return c;
}
ENDCG 
}	
}
FallBack "Diffuse"
}