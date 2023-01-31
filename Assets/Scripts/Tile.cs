    using System.Collections;
using System.Collections.Generic;
using UnityEngine;

enum Line: int
{
    Left = -1,
    Center = 0,
    Right = 1
}

enum Obstacle: int
{
    Empty = 0,
    Heart = 1,
    Balloon = 2,
    Hurdle = 3,
    Trap = 4,
    Monster = 5 
}

public class Tile : MonoBehaviour
{ 
    private float mapSpeed;
    public GameObject heartSrc;
    public GameObject hurdleSrc;
    public GameObject trapSrc;
    public GameObject balloonSrc;
    public GameObject monsterSrc;
    public GameObject passSrc;
    int point;
    GameObject obj;
    
    // 첫 타일은 빈칸, 두번째 타일부터는 장애물이 생성
    void Start()
    {
        // 첫 타일(메뉴상태에서 플레이어가 올라서 있는 타일)이 아닐 경우
        if (GameManager.instance.nextTile != null && gameObject != GameManager.instance.curTile)
        {
            // 타일이 만들어지는 즉시 5군데의 포인트에
            for (point = 0; point <= 4; point++)
            {
                // 장애물을 생성
                MakePath();
            }
        }
    }

    // 게임 중 바닥이 뒤로 진행
    void Update()
    {
        // 게임 상태가 Game이면
        if (GameManager.instance.GetGameState() == GameState.Game)
        {
            // 플레이어의 스피드를 받아와서 그 1.5배만큼의 속도로 타일을 뒤로 움직임
            mapSpeed = Player.instance.speed * 1.5f;
            MoveTile();
        }
    }

    // 타일을 움직임
    void MoveTile()
    {
        // 이 스크립트가 들어간 게임오브젝트(타일)를 z축(앞뒤)방향에서 뒤로(-) 속도 X 시간만큼 움직임
        transform.Translate(0,0, -mapSpeed * Time.deltaTime);
    }

    // 장애물이 있는 타일과 없는 타일을 생성
    void MakePath()
    {
        // 빈 타일을 왼쪽, 가운데, 오른쪽 라인 중 1군데에 생성
        int emptyTile = Random.Range((int)Line.Left, (int)Line.Right + 1);

        //빈 타일 핸들링(콤보를 올리기 위한 투명한 패스존(콜리전 박스), 혹은 하트와 풍선 생성)
        MakeEmpty(emptyTile);

        // 빈 타일이 왼쪽이었으면
        if (emptyTile == (int)Line.Left)
        {
            // 가운데와 오른쪽에 장애물 생성
            MakeObstacle((int)Line.Center);
            MakeObstacle((int)Line.Right);
        }

        //빈 타일이 가운데였으면
        else if (emptyTile == (int)Line.Center)
        {
            //왼쪽과 오른쪽에 장애물 생성
            MakeObstacle((int)Line.Left);
            MakeObstacle((int)Line.Right);
        }

        //빈 타일이 오른쪽이었으면
        else
        { 
            //왼쪽과 가운데에 장애물 생성
            MakeObstacle((int)Line.Center);
            MakeObstacle((int)Line.Left);
        }
    }

    // +요인 생성
    void MakeEmpty(int emptyTile)
    {
        int randBonus = Random.Range(0, 8);

        // 하트와 빈 타일은 패스존이 존재(그냥 지나가기만 해도 콤보가 쌓임)
        // 1/8 확률로 하트 생성
        if (randBonus == 1)
            MakeHeart(emptyTile);

        //패스존 생성, 두 번째 상수값은 패스존의 높이(점프해도, 하지 않아도 닿는 위치)
        MakePassZone(emptyTile, 3);
    }

    // 하트 생성
    void MakeHeart(int emptyTile)
    {
        // heartSrc에 들어있는 프리팹을 Z축 포인트 * 타일의 Z축 간격만큼 떨어진 위치(다음 타일의 위)에 생성
        obj = Instantiate(heartSrc, new Vector3(ConstInfo.tileX + emptyTile * ConstInfo.lineWidth, ConstInfo.tileY, ConstInfo.tileLength + point * ConstInfo.tileTerm), Quaternion.identity);
        // 이를 다음 타일의 자식 오브젝트로 설정
        obj.transform.parent = GameManager.instance.nextTile.transform;
    }

    // 타일과 높이(Y축 좌표)를 받아 콤보가 쌓이는 투명한 패스존 생성
    void MakePassZone(int tile,int y)
    {
        // passSrc에 들어있는 프리팹을 Y축 포인트 * 타일의 Y축 간격,Z축 포인트 * 타일의 Z축 간격만큼 떨어진 위치(다음 타일의 위)에 생성 
        obj = Instantiate(passSrc, new Vector3(ConstInfo.tileX + tile * ConstInfo.lineWidth, ConstInfo.tileY + y, ConstInfo.tileLength + point * ConstInfo.tileTerm),Quaternion.identity);
        // 이를 다음 타일의 자식 오브젝트로 설정
        obj.transform.parent = GameManager.instance.nextTile.transform;
    }

    // 장애물 생성
    void MakeObstacle(int obstacleTile)
    {
        // 허들과 괴물 사이의 장애물중 임의의 하나를 뽑음
        int obstacle = Random.Range(0,81);
        // 허들을 만듦
        if (obstacle >= 0 && obstacle < 35)
            MakeHurdle(obstacleTile);
        // 곰덫을 만듦
        else if (obstacle >= 35 && obstacle < 70)
            MakeTrap(obstacleTile);
        // 풍선을 만듦
        else if (obstacle >= 70 && obstacle < 80)
            MakeBalloon(obstacleTile);
        // 몬스터를 만듦
        else if (obstacle == 80)
            MakeMonster(obstacleTile);
        // 패스존을 23만큼 위로 만듦(점프할 때만 닿는 위치)
        MakePassZone(obstacleTile, 23);
    }

    //허들 생성
    void MakeHurdle(int obstacleTile)
    {
        // hurdleSrc에 들어있는 프리팹을 Z축 포인트 * 타일의 Z축 간격만큼 떨어진 위치(다음 타일의 위)에 생성 
        obj = Instantiate(hurdleSrc, new Vector3(ConstInfo.tileX + obstacleTile * ConstInfo.lineWidth, ConstInfo.tileY - 0.9f, ConstInfo.tileLength + point * ConstInfo.tileTerm), Quaternion.identity);
        // 이를 다음 타일의 자식 오브젝트로 설정
        obj.transform.parent = GameManager.instance.nextTile.transform;
    }
    void MakeTrap(int obstacleTile)
    {
        // trapSrc에 들어있는 프리팹을 Z축 포인트 * 타일의 Z축 간격만큼 떨어진 위치(다음 타일의 위)에 생성 
        obj = Instantiate(trapSrc, new Vector3(ConstInfo.tileX + obstacleTile * ConstInfo.lineWidth, ConstInfo.tileY, ConstInfo.tileLength + point * ConstInfo.tileTerm), Quaternion.identity);
        // 이를 다음 타일의 자식 오브젝트로 설정
        obj.transform.parent = GameManager.instance.nextTile.transform;
    }
    void MakeBalloon(int obstacleTile)
    {
        // balloonSrc에 들어있는 프리팹을 Z축 포인트 * 타일의 Z축 간격만큼 떨어진 위치(다음 타일의 위)에 생성 
        obj = Instantiate(balloonSrc, new Vector3(ConstInfo.tileX + obstacleTile * ConstInfo.lineWidth, ConstInfo.tileY - 4, ConstInfo.tileLength + point * ConstInfo.tileTerm), Quaternion.identity);
        // 이를 다음 타일의 자식 오브젝트로 설정
        obj.transform.parent = GameManager.instance.nextTile.transform;
    }
    void MakeMonster(int obstacleTile)
    {
        // monsterSrc에 들어있는 프리팹을 Z축 포인트 * 타일의 Z축 간격만큼 떨어진 위치(다음 타일의 위)에 생성 
        obj = Instantiate(monsterSrc, new Vector3(ConstInfo.tileX + obstacleTile * ConstInfo.lineWidth, ConstInfo.tileY, ConstInfo.tileLength + point * ConstInfo.tileTerm), Quaternion.Euler(new Vector3(0,180,0)));
        // 이를 다음 타일의 자식 오브젝트로 설정
        obj.transform.parent = GameManager.instance.nextTile.transform;
    }
}
