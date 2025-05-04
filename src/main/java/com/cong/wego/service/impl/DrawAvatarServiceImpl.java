package com.cong.wego.service.impl;

import com.cong.wego.service.DrawAvatarService;
import org.springframework.stereotype.Service;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.awt.geom.Rectangle2D;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.concurrent.ThreadLocalRandom;

@Service
public class DrawAvatarServiceImpl implements DrawAvatarService {
    @Override
    public String generateImageBase64(String userAccount, int size) {
        String text = userAccount.length() > 2 ? userAccount.substring(0, 2) : userAccount;

        // 创建正方形 BufferedImage
        BufferedImage image = new BufferedImage(size, size, BufferedImage.TYPE_INT_ARGB);
        Graphics2D g2d = image.createGraphics();

        // 随机生成两种颜色
        Color color1 = randomColor();
        Color color2 = randomColor();

        // 构造线性渐变
        GradientPaint gp = new GradientPaint(
                0, 0, color1,
                size, size, color2
        );
        g2d.setPaint(gp);
        g2d.fillRect(0, 0, size, size);

        // 在中间绘制白色文字
        g2d.setPaint(Color.WHITE);

        // 字体设为微软雅黑，加粗
        int fontSize = size / 2;
        Font font = new Font("Microsoft YaHei", Font.BOLD, fontSize);
        g2d.setFont(font);

        // 计算文字尺寸以便居中
        FontMetrics fm = g2d.getFontMetrics();
        Rectangle2D textBounds = fm.getStringBounds(text, g2d);
        int textX = (int) ((size - textBounds.getWidth()) / 2);
        int textY = (int) ((size - textBounds.getHeight()) / 2 + fm.getAscent());

        g2d.drawString(text, textX, textY);
        g2d.dispose();

        // 将BufferedImage写入到ByteArrayOutputStream，并转Base64
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        try {
            ImageIO.write(image, "png", baos);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        byte[] imageBytes = baos.toByteArray();
        try {
            baos.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        // Java 8 内置 Base64 编码
        return Base64.getEncoder().encodeToString(imageBytes);
    }

    /** 随机生成一个 RGB 颜色 */
    private static Color randomColor() {
        ThreadLocalRandom r = ThreadLocalRandom.current();
        int red   = r.nextInt(0, 256);
        int green = r.nextInt(0, 256);
        int blue  = r.nextInt(0, 256);
        return new Color(red, green, blue);
    }
}
