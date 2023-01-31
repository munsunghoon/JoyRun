using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HighlightTiles : MonoBehaviour
{
    Renderer leftTile;
    Renderer centerTile;
    Renderer rightTile;

    // 초기에 플레이어 캐릭터가 올라가 있는 흰색 발판 3종류의 렌더러를 받아오고, 가운데 발판을 하이라이트
    void Start()
    {
        leftTile = GameObject.Find("leftTile").GetComponent<Renderer>();
        centerTile = GameObject.Find("centerTile").GetComponent<Renderer>();
        rightTile = GameObject.Find("rightTile").GetComponent<Renderer>();
        Highlight(PlayerLocation.Center);
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    // 위치를 넘기면 그 위치를 하이라이트
    public void Highlight(PlayerLocation curLocation)
    {
        // 먼저 모든 발판을 흰색으로
        turnOffAll();

        // 이후 인풋된 발판을 노란색으로
        if (curLocation == PlayerLocation.Left)
            leftTile.material.color = Color.yellow;
        else if (curLocation == PlayerLocation.Center)
            centerTile.material.color = Color.yellow;
        else
            rightTile.material.color = Color.yellow;
    }

    // 모든 발판을 흰색으로
    void turnOffAll()
    {
        leftTile.material.color = Color.white;
        centerTile.material.color = Color.white;
        rightTile.material.color = Color.white;
    }
}
