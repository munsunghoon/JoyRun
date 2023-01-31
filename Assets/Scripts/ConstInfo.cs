using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ConstInfo : MonoBehaviour
{
    // 점프, 펀치 등 플레이어 캐릭터의 모션이 재생되는 시간
    public const float actionTimer = 0.65f;

    // UI의 HP, 시간 +- 이벤트 문구가 재생되는 시간
    public const float displayTimer = 0.5f;

    // 타일의 Z축 길이
    public const float tileLength = 333.5f;
    // 타일의 XYZ 기본 좌표
    public const float tileX = 114;
    public const float tileY = 0;
    public const float tileZ = 0;

    // 플레이어 캐릭터의 기본 좌표
    public const float playerX = 114;
    public const float playerY = 0;
    public const float playerZ = -40.6f;

    // 트랙의 한 라인의 넓이
    public const float lineWidth = 14;

    // 장애물을 생성하기 위해 타일을 5등분한 길이
    public const float tileTerm = 66;

    // 플레이어 캐릭터의 콜리전 박스의 기본 XYZ 좌표
    public const float originalColliderX = 0;
    public const float originalColliderY = 0.8f;
    public const float originalColliderZ = 0;

    // 플레이어 캐릭터가 점프했을 시 사용되는 콜리전 박스의 Y좌표
    public const float jumpingColliderY = 2;

    // 플레이어 동작 조건 관련 상수
    public const float stepHeight = 130;
    public const float punchDistance = 216;
    public const float jumpHeight = 30;
    public const float jumpFootHeightDifferenceLimit = 21.6f;
    public const float jumpFootPositionVariationLimit = 360;

    // 세팅 메뉴에서 설정할 수 있는 시간, 시작 체력, 최대 체력
    public static float time = 0;
    public static int startHp = 0;
    public static int maxHp = 0;

    public static int monsterHp = 100;

}
