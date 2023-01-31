using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BattleHighlight : MonoBehaviour
{
    Renderer leftTile;
    Renderer centerTile;
    Renderer rightTile;
    // Start is called before the first frame update
    void Start()
    {

        GameManager.instance.SetGameState(GameState.Battle);
        leftTile = GameObject.Find("leftTile").GetComponent<Renderer>();
        centerTile = GameObject.Find("centerTile").GetComponent<Renderer>();
        rightTile = GameObject.Find("rightTile").GetComponent<Renderer>();
        Highlight(BattlePlayerLocation.Center);
    }

    // Update is called once per frame
    void Update()
    {

    }
    public void Highlight(BattlePlayerLocation curLocation)
    {
        turnOffAll();
        if (curLocation == BattlePlayerLocation.Left)
            leftTile.material.color = Color.yellow;
        else if (curLocation == BattlePlayerLocation.Center)
            centerTile.material.color = Color.yellow;
        else
            rightTile.material.color = Color.yellow;
    }
    void turnOffAll()
    {
        leftTile.material.color = Color.white;
        centerTile.material.color = Color.white;
        rightTile.material.color = Color.white;
    }
}
