using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class MissText : MonoBehaviour
{

    private float moveSpeed;
    private float alphaSpeed;
    private float destroyTime;
    TextMeshProUGUI text;
    Color alpha;
    
    // Start is called before the first frame update
    void Start()
    {
        moveSpeed = 0.1f;
        alphaSpeed = 3.0f;
        destroyTime = 2.0f;

        text = GetComponent<TextMeshProUGUI>();
        alpha = text.color;
        Invoke("DestroyObject", destroyTime);
    }

    // Update is called once per frame
    void Update()
    {
        transform.Translate(new Vector3(0, moveSpeed * (-Time.deltaTime), 0));
        alpha.a = Mathf.Lerp(alpha.a, 0, Time.deltaTime * alphaSpeed);

        text.color = alpha;

    }

    private void DestroyObject()
    {
        DestroyObject(gameObject);
    }
}
