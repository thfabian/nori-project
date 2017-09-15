function test()
    phi = linspace(0, 45, 1000)
    
    plot(phi, falloff(phi, 15, 25));
    legend('\theta_f = 15,\theta_w = 25')
    xlabel('\theta')
    ylabel('occlusion')
    set(gcf,'PaperUnits','inches','PaperPosition',[0 0 4 3])
    saveas(gcf, 'occlusion.jpg')
end

function o = falloff(phi, phiF, phiW)
    cosPhi = cos(phi / 180 * pi);
    cosPhiF = cos(phiF / 180 * pi);
    cosPhiW = cos(phiW / 180 * pi);
    
    o = ones(size(phi));
    o(cosPhi < cosPhiF) = ((cosPhi(cosPhi < cosPhiF) - cosPhiW) / (cosPhiF - cosPhiW)).^4;
    o(cosPhi < cosPhiW) = 0;
end