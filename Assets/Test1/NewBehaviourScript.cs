using UnityEngine;
using System.Collections;

public class NewBehaviourScript : MonoBehaviour
{
	private Vector3 dir;

	IEnumerator Start ()
	{
		transform.rotation = Quaternion.Euler (Random.Range (-90f, 90f), Random.Range (-90f, 90f), Random.Range (-90f, 90f));
		yield return new WaitForEndOfFrame();
		dir = new Vector3 (Random.Range (-1f, 1f), Random.Range (-1f, 1f), Random.Range (-1f, 1f)).normalized;
		rigidbody.AddForce (dir, ForceMode.VelocityChange);
	}

	void FixedUpdate ()
	{
		rigidbody.AddTorque (dir * Time.fixedDeltaTime);
	}
}
