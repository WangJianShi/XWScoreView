# XWScoreView
简单高效，高度自定义，异步绘制的高性能评分试图
使用简单（代码如下）

        XWSourceMaker *maker = [[XWSourceMaker alloc] init];
        maker.defaultImage = @"goods_score_empt";
        maker.selectImage = @"goods_score_full";
        maker.space = 10;
        _scoreView = [[XWScoreView alloc] initWithFrame:CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width - 20, 30)  maker:maker];
        _scoreView.delegate = self;
