function [fitresult, gof] = createFit(x, y, err)
    %CREATEFIT(X,Y,ERR)
    %  创建一个拟合。
    %
    %  要进行 '无标题拟合 1' 拟合的数据:
    %      X 输入: x
    %      Y 输出: y
    %      权重: err
    %  输出:
    %      fitresult: 表示拟合的拟合对象。
    %      gof: 带有拟合优度信息的结构体。
    %
    %  另请参阅 FIT, CFIT, SFIT.

    %  由 MATLAB 于 08-May-2023 10:36:21 自动生成


    %% 拟合: '无标题拟合 1'。
    [xData, yData, weights] = prepareCurveData( x, y, err );

    % 设置 fittype 和选项。
    ft = fittype( 'poly4' );
    opts = fitoptions( 'Method', 'LinearLeastSquares' );
    opts.Weights = weights;

    % 对数据进行模型拟合。
    [fitresult, gof] = fit( xData, yData, ft, opts );

%     % 绘制数据拟合图。
%     hold on
%     figure( 'Name', '无标题拟合 1' );
%     plot( fitresult );
%     errorbar(xData, yData, err, 'vertical', '+');
%     legend( 'y vs. x with err', '无标题拟合 1', 'Location', 'NorthEast', 'Interpreter', 'none' );
%     % 为坐标区加标签
%     xlabel( 'x', 'Interpreter', 'none' );
%     ylabel( 'y', 'Interpreter', 'none' );
%     grid on


