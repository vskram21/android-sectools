.class public abstract Lorg/eclipse/jgit/revplot/AbstractPlotRenderer;
.super Ljava/lang/Object;
.source "AbstractPlotRenderer.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T",
        "Lane:Lorg/eclipse/jgit/revplot/PlotLane;",
        "TColor:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final LANE_WIDTH:I = 0xe

.field private static final LEFT_PAD:I = 0x2

.field private static final LINE_WIDTH:I = 0x2


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 79
    .local p0, this:Lorg/eclipse/jgit/revplot/AbstractPlotRenderer;,"Lorg/eclipse/jgit/revplot/AbstractPlotRenderer<TTLane;TTColor;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static computeDotSize(I)I
    .locals 3
    .parameter "h"

    .prologue
    .line 195
    const/16 v1, 0xe

    invoke-static {p0, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x3f00

    mul-float/2addr v1, v2

    float-to-int v0, v1

    .line 196
    .local v0, d:I
    and-int/lit8 v1, v0, 0x1

    add-int/2addr v0, v1

    .line 197
    return v0
.end method

.method private static laneC(Lorg/eclipse/jgit/revplot/PlotLane;)I
    .locals 1
    .parameter "myLane"

    .prologue
    .line 292
    invoke-static {p0}, Lorg/eclipse/jgit/revplot/AbstractPlotRenderer;->laneX(Lorg/eclipse/jgit/revplot/PlotLane;)I

    move-result v0

    add-int/lit8 v0, v0, 0x7

    return v0
.end method

.method private static laneX(Lorg/eclipse/jgit/revplot/PlotLane;)I
    .locals 2
    .parameter "myLane"

    .prologue
    .line 287
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lorg/eclipse/jgit/revplot/PlotLane;->getPosition()I

    move-result v0

    .line 288
    .local v0, p:I
    :goto_0
    mul-int/lit8 v1, v0, 0xe

    add-int/lit8 v1, v1, 0x2

    return v1

    .line 287
    .end local v0           #p:I
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method protected abstract drawBoundaryDot(IIII)V
.end method

.method protected abstract drawCommitDot(IIII)V
.end method

.method protected abstract drawLabel(IILorg/eclipse/jgit/lib/Ref;)I
.end method

.method protected abstract drawLine(Ljava/lang/Object;IIIII)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTColor;IIIII)V"
        }
    .end annotation
.end method

.method protected abstract drawText(Ljava/lang/String;II)V
.end method

.method protected abstract laneColor(Lorg/eclipse/jgit/revplot/PlotLane;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT",
            "Lane;",
            ")TTColor;"
        }
    .end annotation
.end method

.method protected paintCommit(Lorg/eclipse/jgit/revplot/PlotCommit;I)V
    .locals 40
    .parameter
    .parameter "h"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/revplot/PlotCommit",
            "<TT",
            "Lane;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 95
    .local p0, this:Lorg/eclipse/jgit/revplot/AbstractPlotRenderer;,"Lorg/eclipse/jgit/revplot/AbstractPlotRenderer<TTLane;TTColor;>;"
    .local p1, commit:Lorg/eclipse/jgit/revplot/PlotCommit;,"Lorg/eclipse/jgit/revplot/PlotCommit<TTLane;>;"
    invoke-static/range {p2 .. p2}, Lorg/eclipse/jgit/revplot/AbstractPlotRenderer;->computeDotSize(I)I

    move-result v24

    .line 96
    .local v24, dotSize:I
    invoke-virtual/range {p1 .. p1}, Lorg/eclipse/jgit/revplot/PlotCommit;->getLane()Lorg/eclipse/jgit/revplot/PlotLane;

    move-result-object v32

    .line 97
    .local v32, myLane:Lorg/eclipse/jgit/revplot/PlotLane;,"TTLane;"
    invoke-static/range {v32 .. v32}, Lorg/eclipse/jgit/revplot/AbstractPlotRenderer;->laneC(Lorg/eclipse/jgit/revplot/PlotLane;)I

    move-result v33

    .line 98
    .local v33, myLaneX:I
    move-object/from16 v0, p0

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revplot/AbstractPlotRenderer;->laneColor(Lorg/eclipse/jgit/revplot/PlotLane;)Ljava/lang/Object;

    move-result-object v31

    .line 100
    .local v31, myColor:Ljava/lang/Object;,"TTColor;"
    move/from16 v29, v33

    .line 101
    .local v29, maxCenter:I
    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/eclipse/jgit/revplot/PlotCommit;->passingLanes:[Lorg/eclipse/jgit/revplot/PlotLane;

    move-object/from16 v22, v0

    check-cast v22, [Lorg/eclipse/jgit/revplot/PlotLane;

    .local v22, arr$:[Lorg/eclipse/jgit/revplot/PlotLane;
    move-object/from16 v0, v22

    array-length v0, v0

    move/from16 v28, v0

    .local v28, len$:I
    const/16 v27, 0x0

    .local v27, i$:I
    :goto_0
    move/from16 v0, v27

    move/from16 v1, v28

    if-ge v0, v1, :cond_0

    aget-object v38, v22, v27

    .line 102
    .local v38, passingLane:Lorg/eclipse/jgit/revplot/PlotLane;,"TTLane;"
    invoke-static/range {v38 .. v38}, Lorg/eclipse/jgit/revplot/AbstractPlotRenderer;->laneC(Lorg/eclipse/jgit/revplot/PlotLane;)I

    move-result v7

    .line 103
    .local v7, cx:I
    move-object/from16 v0, p0

    move-object/from16 v1, v38

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revplot/AbstractPlotRenderer;->laneColor(Lorg/eclipse/jgit/revplot/PlotLane;)Ljava/lang/Object;

    move-result-object v6

    .line 104
    .local v6, c:Ljava/lang/Object;,"TTColor;"
    const/4 v8, 0x0

    const/4 v11, 0x2

    move-object/from16 v5, p0

    move v9, v7

    move/from16 v10, p2

    invoke-virtual/range {v5 .. v11}, Lorg/eclipse/jgit/revplot/AbstractPlotRenderer;->drawLine(Ljava/lang/Object;IIIII)V

    .line 105
    move/from16 v0, v29

    invoke-static {v0, v7}, Ljava/lang/Math;->max(II)I

    move-result v29

    .line 101
    add-int/lit8 v27, v27, 0x1

    goto :goto_0

    .line 108
    .end local v6           #c:Ljava/lang/Object;,"TTColor;"
    .end local v7           #cx:I
    .end local v38           #passingLane:Lorg/eclipse/jgit/revplot/PlotLane;,"TTLane;"
    :cond_0
    div-int/lit8 v5, v24, 0x2

    sub-int v5, v33, v5

    add-int/lit8 v25, v5, -0x1

    .line 109
    .local v25, dotX:I
    sub-int v5, p2, v24

    div-int/lit8 v20, v5, 0x2

    .line 111
    .local v20, dotY:I
    invoke-virtual/range {p1 .. p1}, Lorg/eclipse/jgit/revplot/PlotCommit;->getParentCount()I

    move-result v35

    .line 112
    .local v35, nParent:I
    if-lez v35, :cond_3

    .line 113
    add-int v5, p2, v24

    div-int/lit8 v13, v5, 0x2

    const/4 v14, 0x2

    move-object/from16 v8, p0

    move-object/from16 v9, v31

    move/from16 v10, v33

    move/from16 v11, p2

    move/from16 v12, v33

    invoke-virtual/range {v8 .. v14}, Lorg/eclipse/jgit/revplot/AbstractPlotRenderer;->drawLine(Ljava/lang/Object;IIIII)V

    .line 116
    const/16 v26, 0x0

    .local v26, i:I
    :goto_1
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/eclipse/jgit/revplot/PlotCommit;->mergingLanes:[Lorg/eclipse/jgit/revplot/PlotLane;

    array-length v5, v5

    move/from16 v0, v26

    if-ge v0, v5, :cond_3

    .line 118
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/eclipse/jgit/revplot/PlotCommit;->mergingLanes:[Lorg/eclipse/jgit/revplot/PlotLane;

    aget-object v37, v5, v26

    .line 119
    .local v37, pLane:Lorg/eclipse/jgit/revplot/PlotLane;,"TTLane;"
    move-object/from16 v0, p0

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revplot/AbstractPlotRenderer;->laneColor(Lorg/eclipse/jgit/revplot/PlotLane;)Ljava/lang/Object;

    move-result-object v9

    .line 120
    .local v9, pColor:Ljava/lang/Object;,"TTColor;"
    invoke-static/range {v37 .. v37}, Lorg/eclipse/jgit/revplot/AbstractPlotRenderer;->laneC(Lorg/eclipse/jgit/revplot/PlotLane;)I

    move-result v7

    .line 122
    .restart local v7       #cx:I
    sub-int v5, v33, v7

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    const/16 v8, 0xe

    if-le v5, v8, :cond_2

    .line 124
    move/from16 v0, v33

    if-ge v0, v7, :cond_1

    .line 125
    add-int/lit8 v12, v7, -0x7

    .line 129
    .local v12, ix:I
    :goto_2
    div-int/lit8 v11, p2, 0x2

    div-int/lit8 v13, p2, 0x2

    const/4 v14, 0x2

    move-object/from16 v8, p0

    move/from16 v10, v33

    invoke-virtual/range {v8 .. v14}, Lorg/eclipse/jgit/revplot/AbstractPlotRenderer;->drawLine(Ljava/lang/Object;IIIII)V

    .line 130
    div-int/lit8 v13, p2, 0x2

    const/16 v16, 0x2

    move-object/from16 v10, p0

    move-object v11, v9

    move v14, v7

    move/from16 v15, p2

    invoke-virtual/range {v10 .. v16}, Lorg/eclipse/jgit/revplot/AbstractPlotRenderer;->drawLine(Ljava/lang/Object;IIIII)V

    .line 134
    .end local v12           #ix:I
    :goto_3
    move/from16 v0, v29

    invoke-static {v0, v7}, Ljava/lang/Math;->max(II)I

    move-result v29

    .line 116
    add-int/lit8 v26, v26, 0x1

    goto :goto_1

    .line 127
    :cond_1
    add-int/lit8 v12, v7, 0x7

    .restart local v12       #ix:I
    goto :goto_2

    .line 132
    .end local v12           #ix:I
    :cond_2
    div-int/lit8 v16, p2, 0x2

    const/16 v19, 0x2

    move-object/from16 v13, p0

    move-object v14, v9

    move/from16 v15, v33

    move/from16 v17, v7

    move/from16 v18, p2

    invoke-virtual/range {v13 .. v19}, Lorg/eclipse/jgit/revplot/AbstractPlotRenderer;->drawLine(Ljava/lang/Object;IIIII)V

    goto :goto_3

    .line 139
    .end local v7           #cx:I
    .end local v9           #pColor:Ljava/lang/Object;,"TTColor;"
    .end local v26           #i:I
    .end local v37           #pLane:Lorg/eclipse/jgit/revplot/PlotLane;,"TTLane;"
    :cond_3
    invoke-virtual/range {p1 .. p1}, Lorg/eclipse/jgit/revplot/PlotCommit;->getChildCount()I

    move-result v5

    if-lez v5, :cond_7

    .line 140
    const/16 v26, 0x0

    .restart local v26       #i:I
    :goto_4
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/eclipse/jgit/revplot/PlotCommit;->forkingOffLanes:[Lorg/eclipse/jgit/revplot/PlotLane;

    array-length v5, v5

    move/from16 v0, v26

    if-ge v0, v5, :cond_6

    .line 142
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/eclipse/jgit/revplot/PlotCommit;->forkingOffLanes:[Lorg/eclipse/jgit/revplot/PlotLane;

    aget-object v23, v5, v26

    .line 143
    .local v23, childLane:Lorg/eclipse/jgit/revplot/PlotLane;,"TTLane;"
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revplot/AbstractPlotRenderer;->laneColor(Lorg/eclipse/jgit/revplot/PlotLane;)Ljava/lang/Object;

    move-result-object v14

    .line 144
    .local v14, cColor:Ljava/lang/Object;,"TTColor;"
    invoke-static/range {v23 .. v23}, Lorg/eclipse/jgit/revplot/AbstractPlotRenderer;->laneC(Lorg/eclipse/jgit/revplot/PlotLane;)I

    move-result v7

    .line 145
    .restart local v7       #cx:I
    sub-int v5, v33, v7

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    const/16 v8, 0xe

    if-le v5, v8, :cond_5

    .line 147
    move/from16 v0, v33

    if-ge v0, v7, :cond_4

    .line 148
    add-int/lit8 v12, v7, -0x7

    .line 152
    .restart local v12       #ix:I
    :goto_5
    div-int/lit8 v16, p2, 0x2

    div-int/lit8 v18, p2, 0x2

    const/16 v19, 0x2

    move-object/from16 v13, p0

    move/from16 v15, v33

    move/from16 v17, v12

    invoke-virtual/range {v13 .. v19}, Lorg/eclipse/jgit/revplot/AbstractPlotRenderer;->drawLine(Ljava/lang/Object;IIIII)V

    .line 153
    div-int/lit8 v16, p2, 0x2

    const/16 v18, 0x0

    const/16 v19, 0x2

    move-object/from16 v13, p0

    move v15, v12

    move/from16 v17, v7

    invoke-virtual/range {v13 .. v19}, Lorg/eclipse/jgit/revplot/AbstractPlotRenderer;->drawLine(Ljava/lang/Object;IIIII)V

    .line 157
    .end local v12           #ix:I
    :goto_6
    move/from16 v0, v29

    invoke-static {v0, v7}, Ljava/lang/Math;->max(II)I

    move-result v29

    .line 140
    add-int/lit8 v26, v26, 0x1

    goto :goto_4

    .line 150
    :cond_4
    add-int/lit8 v12, v7, 0x7

    .restart local v12       #ix:I
    goto :goto_5

    .line 155
    .end local v12           #ix:I
    :cond_5
    div-int/lit8 v16, p2, 0x2

    const/16 v18, 0x0

    const/16 v19, 0x2

    move-object/from16 v13, p0

    move/from16 v15, v33

    move/from16 v17, v7

    invoke-virtual/range {v13 .. v19}, Lorg/eclipse/jgit/revplot/AbstractPlotRenderer;->drawLine(Ljava/lang/Object;IIIII)V

    goto :goto_6

    .line 160
    .end local v7           #cx:I
    .end local v14           #cColor:Ljava/lang/Object;,"TTColor;"
    .end local v23           #childLane:Lorg/eclipse/jgit/revplot/PlotLane;,"TTLane;"
    :cond_6
    invoke-virtual/range {p1 .. p1}, Lorg/eclipse/jgit/revplot/PlotCommit;->getChildCount()I

    move-result v5

    move-object/from16 v0, p1

    iget-object v8, v0, Lorg/eclipse/jgit/revplot/PlotCommit;->forkingOffLanes:[Lorg/eclipse/jgit/revplot/PlotLane;

    array-length v8, v8

    sub-int v36, v5, v8

    .line 162
    .local v36, nonForkingChildren:I
    if-lez v36, :cond_7

    .line 163
    const/16 v18, 0x0

    const/16 v21, 0x2

    move-object/from16 v15, p0

    move-object/from16 v16, v31

    move/from16 v17, v33

    move/from16 v19, v33

    invoke-virtual/range {v15 .. v21}, Lorg/eclipse/jgit/revplot/AbstractPlotRenderer;->drawLine(Ljava/lang/Object;IIIII)V

    .line 166
    .end local v26           #i:I
    .end local v36           #nonForkingChildren:I
    :cond_7
    sget-object v5, Lorg/eclipse/jgit/revwalk/RevFlag;->UNINTERESTING:Lorg/eclipse/jgit/revwalk/RevFlag;

    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Lorg/eclipse/jgit/revplot/PlotCommit;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 167
    move-object/from16 v0, p0

    move/from16 v1, v25

    move/from16 v2, v20

    move/from16 v3, v24

    move/from16 v4, v24

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/eclipse/jgit/revplot/AbstractPlotRenderer;->drawBoundaryDot(IIII)V

    .line 171
    :goto_7
    add-int/lit8 v5, v29, 0x7

    add-int v8, v25, v24

    invoke-static {v5, v8}, Ljava/lang/Math;->max(II)I

    move-result v5

    add-int/lit8 v39, v5, 0x8

    .line 172
    .local v39, textx:I
    move-object/from16 v0, p1

    iget-object v5, v0, Lorg/eclipse/jgit/revplot/PlotCommit;->refs:[Lorg/eclipse/jgit/lib/Ref;

    array-length v0, v5

    move/from16 v34, v0

    .line 173
    .local v34, n:I
    const/16 v26, 0x0

    .restart local v26       #i:I
    :goto_8
    move/from16 v0, v26

    move/from16 v1, v34

    if-ge v0, v1, :cond_9

    .line 174
    add-int v5, v39, v24

    div-int/lit8 v8, p2, 0x2

    move-object/from16 v0, p1

    iget-object v10, v0, Lorg/eclipse/jgit/revplot/PlotCommit;->refs:[Lorg/eclipse/jgit/lib/Ref;

    aget-object v10, v10, v26

    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v8, v10}, Lorg/eclipse/jgit/revplot/AbstractPlotRenderer;->drawLabel(IILorg/eclipse/jgit/lib/Ref;)I

    move-result v5

    add-int v39, v39, v5

    .line 173
    add-int/lit8 v26, v26, 0x1

    goto :goto_8

    .line 169
    .end local v26           #i:I
    .end local v34           #n:I
    .end local v39           #textx:I
    :cond_8
    move-object/from16 v0, p0

    move/from16 v1, v25

    move/from16 v2, v20

    move/from16 v3, v24

    move/from16 v4, v24

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/eclipse/jgit/revplot/AbstractPlotRenderer;->drawCommitDot(IIII)V

    goto :goto_7

    .line 177
    .restart local v26       #i:I
    .restart local v34       #n:I
    .restart local v39       #textx:I
    :cond_9
    invoke-virtual/range {p1 .. p1}, Lorg/eclipse/jgit/revplot/PlotCommit;->getShortMessage()Ljava/lang/String;

    move-result-object v30

    .line 178
    .local v30, msg:Ljava/lang/String;
    add-int v5, v39, v24

    div-int/lit8 v8, p2, 0x2

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-virtual {v0, v1, v5, v8}, Lorg/eclipse/jgit/revplot/AbstractPlotRenderer;->drawText(Ljava/lang/String;II)V

    .line 179
    return-void
.end method
