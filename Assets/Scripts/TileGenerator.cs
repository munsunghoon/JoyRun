using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TileGenerator : MonoBehaviour
{
    public GameObject tile;
    // Start is called before the first frame update
    void Start()
    {
    }

    // Update is called once per frame
    void Update()
    {
        // 타일 생성
        MakeTile();
    }

    // 타일 생성
    public void MakeTile()
    {
        // 타일이 아무것도 없으면 플레이어의 바로 앞에 타일을 생성하고 어사인
        if (GameManager.instance.curTile == null)
            GameManager.instance.curTile = Instantiate(tile, new Vector3(ConstInfo.tileX, ConstInfo.tileY, ConstInfo.tileZ), Quaternion.identity);

        // 다음 타일이 존재하면(게임 월드 상에 타일이 2개 존재하면)
        if (GameManager.instance.nextTile != null)
        {
            // 다음 타일의 Z축 위치가 0보다 작아지면(플레이어 캐릭터보다 다음 타일의 시작점이 뒤로 갔을 경우)
            // = (플레이어 캐릭터보다 현재 타일의 끝점이 뒤로 가서 안보이게 되었을 경우)
            if (GameManager.instance.nextTile.transform.position.z < 0)
            {
                // 현재 타일을 삭제
                Destroy(GameManager.instance.curTile);

                // 현재 타일을 다음 타일로 변경
                GameManager.instance.curTile = GameManager.instance.nextTile;

                // 다음 타일을 현재 타일의 끝에 생성
                GameManager.instance.nextTile = Instantiate(tile, new Vector3(ConstInfo.tileX, ConstInfo.tileY, ConstInfo.tileLength), Quaternion.identity);
            }
        }
        // 다음 타일이 없으면(현재 타일을 생성한 직후이면)
        else
        {
            // 다음 타일을 현재 타일의 끝에 생성
            GameManager.instance.nextTile = Instantiate(tile, new Vector3(ConstInfo.tileX, ConstInfo.tileY, ConstInfo.tileLength), Quaternion.identity);
        }
    }

}
