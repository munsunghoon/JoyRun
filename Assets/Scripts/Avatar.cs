using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Avatar : MonoBehaviour
{
    public static Vector3 userPosition;
    public static Vector3 userPositionHead;
    public static Vector3 userPositionRightHand;
    public static Vector3 userPositionLeftHand;
    public static Vector3 userPositionRightFoot;
    public static Vector3 userPositionLeftFoot;
    public static float distanceHandElbow;
    public static float distanceFootKnee;
    private static bool userValid;
    
    // Start is called before the first frame update
    static void Start() { InitAvatar(); }
    
    //아바타 구성요소 초기화
    static void InitAvatar() {
        userPosition = Vector3.zero;
        userPositionHead = Vector3.zero;
        userPositionRightHand = Vector3.zero;
        userPositionLeftHand = Vector3.zero;
        userPositionRightFoot = Vector3.zero;
        userPositionLeftFoot = Vector3.zero;

        distanceFootKnee = 0;
        distanceHandElbow = 0;
    }
    
    
    // 키넥트 좌표를 게임 상의 좌표로 변환 (좌우: -1.35 ~ 1.35 => -960 ~ 96/ 앞뒤: 2.2 ~ 0.7 => -540 ~ 540)
    public static Vector3 HandleKinectPosition(Vector3 kinectPosition)    {
        return new Vector3(kinectPosition.x * 711, kinectPosition.y * 720,
         (kinectPosition.z - 1.45f) * -720);
    }
    
     // 유저 존재 여부 Getter & Setter
    public static bool GetUserValid() { return userValid; }
    public static void SetUserValid(bool newUserValid) { userValid = newUserValid; }
}

