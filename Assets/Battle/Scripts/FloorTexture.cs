using System.Collections;
using System.Collections.Generic;
using System.Xml.Serialization;
using UnityEngine;
using static UnityEngine.LowLevel.PlayerLoop;
using UnityEngine.UI;

public class FloorTexture : MonoBehaviour
{


    public static Texture2D FloorTileSelected;
    public static Texture2D FloorTileUnSelected;



    void Start()
    {
        FloorTileSelected = Resources.Load("Image/FloorTileSelected") as Texture2D;
        FloorTileUnSelected = Resources.Load("Image/FloorTileUnSelected") as Texture2D;
    }

    // 바닥 타일의 텍스처를 변경
    public static void setFloorTileTexture(GameObject obj, Texture newTexture) {       obj.GetComponent<RawImage>().texture = newTexture; }

}