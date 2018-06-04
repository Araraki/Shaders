using System;
using UnityEngine;

[ExecuteInEditMode]
[AddComponentMenu("Custom/BSC_Effect")]
public class BSC_Effect : MonoBehaviour
{
	protected static class Uniforms
	{
		public static readonly int _BrightnessAmount = Shader.PropertyToID("_brightnessAmount");
		public static readonly int _SatAmount = Shader.PropertyToID("_satAmount");
		public static readonly int _ConAmount = Shader.PropertyToID("_conAmount");
	}

	public Shader shader;
	private Material m_Material;
	protected Material material
	{
		get
		{
			if (m_Material == null)
			{
				m_Material = new Material(shader);
				m_Material.hideFlags = HideFlags.HideAndDontSave;
			}
			return m_Material;
		}
	}

	[Range(0f, 1f)] public float BrightnessAmount = 1f;
	[Range(0f, 1f)] public float SatAmount = 1f;
	[Range(0f, 1f)] public float ConAmount = 1f;

	void OnRenderImage (RenderTexture source, RenderTexture destination)
    {
		material.SetFloat(Uniforms._BrightnessAmount, BrightnessAmount);
	    material.SetFloat(Uniforms._SatAmount, SatAmount);
		material.SetFloat(Uniforms._ConAmount, ConAmount);
		Graphics.Blit(source, destination, material);
	}
}

