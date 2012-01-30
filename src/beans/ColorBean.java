package beans;

import java.awt.Color;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

public class ColorBean {

	private Color color;
	private Map<Color, String> colorMap;

	public ColorBean() {
		init();
	}

	private void init() {
		colorMap = new HashMap<Color, String>();
		// populate the hashmap with the colors defined in the Color class
		for (Field f : Color.class.getFields()) {
			if (f.getType() == Color.class) {
				Color c = null;
				try {
					c = (Color) f.get(null);
					colorMap.put(c, f.getName());
				} catch (IllegalArgumentException e) {
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				}
			}
		}

		List<Color> colorList = new ArrayList<Color>(colorMap.keySet());
		int randomIndex = new Random().nextInt(colorList.size());
		color = colorList.get(randomIndex);
	}

	public int getRed() {
		return color.getRed();
	}

	public int getGreen() {
		return color.getGreen();
	}

	public int getBlue() {
		return color.getBlue();
	}

	public String getColorByName() {
		return colorMap.get(color).toLowerCase();
	}

	public void setColorByName(String colorName) {
		Field field;
		try {
			field = Class.forName("java.awt.Color").getField(
					colorName.toUpperCase());
			this.color = (Color) field.get(null);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
