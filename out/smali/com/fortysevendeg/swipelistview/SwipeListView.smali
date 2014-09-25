.class public Lcom/fortysevendeg/swipelistview/SwipeListView;
.super Landroid/widget/ListView;
.source "SwipeListView.java"


# static fields
.field public static final DEBUG:Z = false

.field public static final SWIPE_ACTION_CHOICE:I = 0x2

.field public static final SWIPE_ACTION_DISMISS:I = 0x1

.field public static final SWIPE_ACTION_NONE:I = 0x3

.field public static final SWIPE_ACTION_REVEAL:I = 0x0

.field public static final SWIPE_DEFAULT_BACK_VIEW:Ljava/lang/String; = "swipelist_backview"

.field public static final SWIPE_DEFAULT_FRONT_VIEW:Ljava/lang/String; = "swipelist_frontview"

.field public static final SWIPE_MODE_BOTH:I = 0x1

.field public static final SWIPE_MODE_DEFAULT:I = -0x1

.field public static final SWIPE_MODE_LEFT:I = 0x3

.field public static final SWIPE_MODE_NONE:I = 0x0

.field public static final SWIPE_MODE_RIGHT:I = 0x2

.field public static final TAG:Ljava/lang/String; = "SwipeListView"

.field private static final TOUCH_STATE_REST:I = 0x0

.field private static final TOUCH_STATE_SCROLLING_X:I = 0x1

.field private static final TOUCH_STATE_SCROLLING_Y:I = 0x2


# instance fields
.field private lastMotionX:F

.field private lastMotionY:F

.field swipeBackView:I

.field swipeFrontView:I

.field private swipeListViewListener:Lcom/fortysevendeg/swipelistview/SwipeListViewListener;

.field private touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

.field private touchSlop:I

.field private touchState:I


# direct methods
.method public constructor <init>(Landroid/content/Context;II)V
    .locals 1
    .parameter "context"
    .parameter "swipeBackView"
    .parameter "swipeFrontView"

    .prologue
    const/4 v0, 0x0

    .line 149
    invoke-direct {p0, p1}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    .line 121
    iput v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchState:I

    .line 127
    iput v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeFrontView:I

    .line 128
    iput v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeBackView:I

    .line 150
    iput p3, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeFrontView:I

    .line 151
    iput p2, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeBackView:I

    .line 152
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/fortysevendeg/swipelistview/SwipeListView;->init(Landroid/util/AttributeSet;)V

    .line 153
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    const/4 v0, 0x0

    .line 159
    invoke-direct {p0, p1, p2}, Landroid/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 121
    iput v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchState:I

    .line 127
    iput v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeFrontView:I

    .line 128
    iput v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeBackView:I

    .line 160
    invoke-direct {p0, p2}, Lcom/fortysevendeg/swipelistview/SwipeListView;->init(Landroid/util/AttributeSet;)V

    .line 161
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const/4 v0, 0x0

    .line 167
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 121
    iput v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchState:I

    .line 127
    iput v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeFrontView:I

    .line 128
    iput v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeBackView:I

    .line 168
    invoke-direct {p0, p2}, Lcom/fortysevendeg/swipelistview/SwipeListView;->init(Landroid/util/AttributeSet;)V

    .line 169
    return-void
.end method

.method static synthetic access$000(Lcom/fortysevendeg/swipelistview/SwipeListView;)Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 39
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    return-object v0
.end method

.method private checkInMoving(FF)V
    .locals 7
    .parameter "x"
    .parameter "y"

    .prologue
    const/4 v4, 0x0

    const/4 v5, 0x1

    .line 677
    iget v6, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->lastMotionX:F

    sub-float v6, p1, v6

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    float-to-int v1, v6

    .line 678
    .local v1, xDiff:I
    iget v6, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->lastMotionY:F

    sub-float v6, p2, v6

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    float-to-int v3, v6

    .line 680
    .local v3, yDiff:I
    iget v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchSlop:I

    .line 681
    .local v0, touchSlop:I
    if-le v1, v0, :cond_3

    move v2, v5

    .line 682
    .local v2, xMoved:Z
    :goto_0
    if-le v3, v0, :cond_0

    move v4, v5

    .line 684
    .local v4, yMoved:Z
    :cond_0
    if-eqz v2, :cond_1

    .line 685
    iput v5, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchState:I

    .line 686
    iput p1, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->lastMotionX:F

    .line 687
    iput p2, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->lastMotionY:F

    .line 690
    :cond_1
    if-eqz v4, :cond_2

    .line 691
    const/4 v5, 0x2

    iput v5, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchState:I

    .line 692
    iput p1, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->lastMotionX:F

    .line 693
    iput p2, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->lastMotionY:F

    .line 695
    :cond_2
    return-void

    .end local v2           #xMoved:Z
    .end local v4           #yMoved:Z
    :cond_3
    move v2, v4

    .line 681
    goto :goto_0
.end method

.method private init(Landroid/util/AttributeSet;)V
    .locals 22
    .parameter "attrs"

    .prologue
    .line 178
    const/4 v13, 0x1

    .line 179
    .local v13, swipeMode:I
    const/16 v16, 0x1

    .line 180
    .local v16, swipeOpenOnLongPress:Z
    const/4 v10, 0x1

    .line 181
    .local v10, swipeCloseAllItemsWhenMoveList:Z
    const-wide/16 v8, 0x0

    .line 182
    .local v8, swipeAnimationTime:J
    const/4 v14, 0x0

    .line 183
    .local v14, swipeOffsetLeft:F
    const/4 v15, 0x0

    .line 184
    .local v15, swipeOffsetRight:F
    const/4 v11, 0x0

    .line 185
    .local v11, swipeDrawableChecked:I
    const/4 v12, 0x0

    .line 187
    .local v12, swipeDrawableUnchecked:I
    const/4 v6, 0x0

    .line 188
    .local v6, swipeActionLeft:I
    const/4 v7, 0x0

    .line 190
    .local v7, swipeActionRight:I
    if-eqz p1, :cond_0

    .line 191
    invoke-virtual/range {p0 .. p0}, Lcom/fortysevendeg/swipelistview/SwipeListView;->getContext()Landroid/content/Context;

    move-result-object v17

    sget-object v18, Lcom/fortysevendeg/swipelistview/R$styleable;->SwipeListView:[I

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v5

    .line 192
    .local v5, styled:Landroid/content/res/TypedArray;
    const/16 v17, 0x7

    const/16 v18, 0x1

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v5, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v13

    .line 193
    const/16 v17, 0x8

    const/16 v18, 0x0

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v5, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v6

    .line 194
    const/16 v17, 0x9

    const/16 v18, 0x0

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v5, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v7

    .line 195
    const/16 v17, 0x2

    const/16 v18, 0x0

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v5, v0, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v14

    .line 196
    const/16 v17, 0x3

    const/16 v18, 0x0

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v5, v0, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v15

    .line 197
    const/16 v17, 0x0

    const/16 v18, 0x1

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v5, v0, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v16

    .line 198
    const/16 v17, 0x1

    const/16 v18, 0x0

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v5, v0, v1}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v17

    move/from16 v0, v17

    int-to-long v8, v0

    .line 199
    const/16 v17, 0x4

    const/16 v18, 0x1

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v5, v0, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v10

    .line 200
    const/16 v17, 0xa

    const/16 v18, 0x0

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v5, v0, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v11

    .line 201
    const/16 v17, 0xb

    const/16 v18, 0x0

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v5, v0, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v12

    .line 202
    const/16 v17, 0x5

    const/16 v18, 0x0

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v5, v0, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeFrontView:I

    .line 203
    const/16 v17, 0x6

    const/16 v18, 0x0

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v5, v0, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeBackView:I

    .line 204
    invoke-virtual {v5}, Landroid/content/res/TypedArray;->recycle()V

    .line 207
    .end local v5           #styled:Landroid/content/res/TypedArray;
    :cond_0
    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeFrontView:I

    move/from16 v17, v0

    if-eqz v17, :cond_1

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeBackView:I

    move/from16 v17, v0

    if-nez v17, :cond_3

    .line 208
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lcom/fortysevendeg/swipelistview/SwipeListView;->getContext()Landroid/content/Context;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v17

    const-string v18, "swipelist_frontview"

    const-string v19, "id"

    invoke-virtual/range {p0 .. p0}, Lcom/fortysevendeg/swipelistview/SwipeListView;->getContext()Landroid/content/Context;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v17 .. v20}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeFrontView:I

    .line 209
    invoke-virtual/range {p0 .. p0}, Lcom/fortysevendeg/swipelistview/SwipeListView;->getContext()Landroid/content/Context;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v17

    const-string v18, "swipelist_backview"

    const-string v19, "id"

    invoke-virtual/range {p0 .. p0}, Lcom/fortysevendeg/swipelistview/SwipeListView;->getContext()Landroid/content/Context;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v17 .. v20}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeBackView:I

    .line 211
    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeFrontView:I

    move/from16 v17, v0

    if-eqz v17, :cond_2

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeBackView:I

    move/from16 v17, v0

    if-nez v17, :cond_3

    .line 212
    :cond_2
    new-instance v17, Ljava/lang/RuntimeException;

    const-string v18, "You forgot the attributes swipeFrontView or swipeBackView. You can add this attributes or use \'%s\' and \'%s\' identifiers"

    const/16 v19, 0x2

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    const-string v21, "swipelist_frontview"

    aput-object v21, v19, v20

    const/16 v20, 0x1

    const-string v21, "swipelist_backview"

    aput-object v21, v19, v20

    invoke-static/range {v18 .. v19}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 216
    :cond_3
    invoke-virtual/range {p0 .. p0}, Lcom/fortysevendeg/swipelistview/SwipeListView;->getContext()Landroid/content/Context;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v4

    .line 217
    .local v4, configuration:Landroid/view/ViewConfiguration;
    invoke-static {v4}, Landroid/support/v4/view/ViewConfigurationCompat;->getScaledPagingTouchSlop(Landroid/view/ViewConfiguration;)I

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchSlop:I

    .line 218
    new-instance v17, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeFrontView:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeBackView:I

    move/from16 v19, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    move/from16 v2, v18

    move/from16 v3, v19

    invoke-direct {v0, v1, v2, v3}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;-><init>(Lcom/fortysevendeg/swipelistview/SwipeListView;II)V

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    .line 219
    const-wide/16 v17, 0x0

    cmp-long v17, v8, v17

    if-lez v17, :cond_4

    .line 220
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v8, v9}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->setAnimationTime(J)V

    .line 222
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v15}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->setRightOffset(F)V

    .line 223
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v14}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->setLeftOffset(F)V

    .line 224
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v6}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->setSwipeActionLeft(I)V

    .line 225
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v7}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->setSwipeActionRight(I)V

    .line 226
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v13}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->setSwipeMode(I)V

    .line 227
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v10}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->setSwipeClosesAllItemsWhenListMoves(Z)V

    .line 228
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->setSwipeOpenOnLongPress(Z)V

    .line 229
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v11}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->setSwipeDrawableChecked(I)V

    .line 230
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v12}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->setSwipeDrawableUnchecked(I)V

    .line 231
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/fortysevendeg/swipelistview/SwipeListView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 232
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->makeScrollListener()Landroid/widget/AbsListView$OnScrollListener;

    move-result-object v17

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/fortysevendeg/swipelistview/SwipeListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 233
    return-void
.end method


# virtual methods
.method protected changeSwipeMode(I)I
    .locals 2
    .parameter "position"

    .prologue
    const/4 v0, -0x1

    .line 518
    iget-object v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeListViewListener:Lcom/fortysevendeg/swipelistview/SwipeListViewListener;

    if-eqz v1, :cond_0

    if-eq p1, v0, :cond_0

    .line 519
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeListViewListener:Lcom/fortysevendeg/swipelistview/SwipeListViewListener;

    invoke-interface {v0, p1}, Lcom/fortysevendeg/swipelistview/SwipeListViewListener;->onChangeSwipeMode(I)I

    move-result v0

    .line 521
    :cond_0
    return v0
.end method

.method public closeAnimate(I)V
    .locals 1
    .parameter "position"

    .prologue
    .line 363
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-virtual {v0, p1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->closeAnimate(I)V

    .line 364
    return-void
.end method

.method public closeOpenedItems()V
    .locals 1

    .prologue
    .line 701
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-virtual {v0}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->closeOpenedItems()V

    .line 702
    return-void
.end method

.method public dismiss(I)V
    .locals 3
    .parameter "position"

    .prologue
    .line 313
    iget-object v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-virtual {v2, p1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->dismiss(I)I

    move-result v1

    .line 314
    .local v1, height:I
    if-lez v1, :cond_0

    .line 315
    iget-object v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-virtual {v2, v1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->handlerPendingDismisses(I)V

    .line 322
    :goto_0
    return-void

    .line 317
    :cond_0
    const/4 v2, 0x1

    new-array v0, v2, [I

    .line 318
    .local v0, dismissPositions:[I
    const/4 v2, 0x0

    aput p1, v0, v2

    .line 319
    invoke-virtual {p0, v0}, Lcom/fortysevendeg/swipelistview/SwipeListView;->onDismiss([I)V

    .line 320
    iget-object v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-virtual {v2}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->resetPendingDismisses()V

    goto :goto_0
.end method

.method public dismissSelected()V
    .locals 7

    .prologue
    .line 328
    iget-object v6, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-virtual {v6}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->getPositionsSelected()Ljava/util/List;

    move-result-object v4

    .line 329
    .local v4, list:Ljava/util/List;,"Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v6

    new-array v1, v6, [I

    .line 330
    .local v1, dismissPositions:[I
    const/4 v2, 0x0

    .line 331
    .local v2, height:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v6

    if-ge v3, v6, :cond_1

    .line 332
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 333
    .local v5, position:I
    aput v5, v1, v3

    .line 334
    iget-object v6, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-virtual {v6, v5}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->dismiss(I)I

    move-result v0

    .line 335
    .local v0, auxHeight:I
    if-lez v0, :cond_0

    .line 336
    move v2, v0

    .line 331
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 339
    .end local v0           #auxHeight:I
    .end local v5           #position:I
    :cond_1
    if-lez v2, :cond_2

    .line 340
    iget-object v6, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-virtual {v6, v2}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->handlerPendingDismisses(I)V

    .line 345
    :goto_1
    iget-object v6, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-virtual {v6}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->returnOldActions()V

    .line 346
    return-void

    .line 342
    :cond_2
    invoke-virtual {p0, v1}, Lcom/fortysevendeg/swipelistview/SwipeListView;->onDismiss([I)V

    .line 343
    iget-object v6, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-virtual {v6}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->resetPendingDismisses()V

    goto :goto_1
.end method

.method public getCountSelected()I
    .locals 1

    .prologue
    .line 279
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-virtual {v0}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->getCountSelected()I

    move-result v0

    return v0
.end method

.method public getPositionsSelected()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 270
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-virtual {v0}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->getPositionsSelected()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getSwipeActionLeft()I
    .locals 1

    .prologue
    .line 591
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-virtual {v0}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->getSwipeActionLeft()I

    move-result v0

    return v0
.end method

.method public getSwipeActionRight()I
    .locals 1

    .prologue
    .line 609
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-virtual {v0}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->getSwipeActionRight()I

    move-result v0

    return v0
.end method

.method public isChecked(I)Z
    .locals 1
    .parameter "position"

    .prologue
    .line 261
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-virtual {v0, p1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->isChecked(I)Z

    move-result v0

    return v0
.end method

.method protected onChoiceChanged(IZ)V
    .locals 1
    .parameter "position"
    .parameter "selected"

    .prologue
    .line 455
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeListViewListener:Lcom/fortysevendeg/swipelistview/SwipeListViewListener;

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    .line 456
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeListViewListener:Lcom/fortysevendeg/swipelistview/SwipeListViewListener;

    invoke-interface {v0, p1, p2}, Lcom/fortysevendeg/swipelistview/SwipeListViewListener;->onChoiceChanged(IZ)V

    .line 458
    :cond_0
    return-void
.end method

.method protected onChoiceEnded()V
    .locals 1

    .prologue
    .line 473
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeListViewListener:Lcom/fortysevendeg/swipelistview/SwipeListViewListener;

    if-eqz v0, :cond_0

    .line 474
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeListViewListener:Lcom/fortysevendeg/swipelistview/SwipeListViewListener;

    invoke-interface {v0}, Lcom/fortysevendeg/swipelistview/SwipeListViewListener;->onChoiceEnded()V

    .line 476
    :cond_0
    return-void
.end method

.method protected onChoiceStarted()V
    .locals 1

    .prologue
    .line 464
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeListViewListener:Lcom/fortysevendeg/swipelistview/SwipeListViewListener;

    if-eqz v0, :cond_0

    .line 465
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeListViewListener:Lcom/fortysevendeg/swipelistview/SwipeListViewListener;

    invoke-interface {v0}, Lcom/fortysevendeg/swipelistview/SwipeListViewListener;->onChoiceStarted()V

    .line 467
    :cond_0
    return-void
.end method

.method protected onClickBackView(I)V
    .locals 1
    .parameter "position"

    .prologue
    .line 419
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeListViewListener:Lcom/fortysevendeg/swipelistview/SwipeListViewListener;

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    .line 420
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeListViewListener:Lcom/fortysevendeg/swipelistview/SwipeListViewListener;

    invoke-interface {v0, p1}, Lcom/fortysevendeg/swipelistview/SwipeListViewListener;->onClickBackView(I)V

    .line 422
    :cond_0
    return-void
.end method

.method protected onClickFrontView(I)V
    .locals 1
    .parameter "position"

    .prologue
    .line 408
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeListViewListener:Lcom/fortysevendeg/swipelistview/SwipeListViewListener;

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    .line 409
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeListViewListener:Lcom/fortysevendeg/swipelistview/SwipeListViewListener;

    invoke-interface {v0, p1}, Lcom/fortysevendeg/swipelistview/SwipeListViewListener;->onClickFrontView(I)V

    .line 411
    :cond_0
    return-void
.end method

.method protected onClosed(IZ)V
    .locals 1
    .parameter "position"
    .parameter "fromRight"

    .prologue
    .line 443
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeListViewListener:Lcom/fortysevendeg/swipelistview/SwipeListViewListener;

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    .line 444
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeListViewListener:Lcom/fortysevendeg/swipelistview/SwipeListViewListener;

    invoke-interface {v0, p1, p2}, Lcom/fortysevendeg/swipelistview/SwipeListViewListener;->onClosed(IZ)V

    .line 446
    :cond_0
    return-void
.end method

.method protected onDismiss([I)V
    .locals 1
    .parameter "reverseSortedPositions"

    .prologue
    .line 372
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeListViewListener:Lcom/fortysevendeg/swipelistview/SwipeListViewListener;

    if-eqz v0, :cond_0

    .line 373
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeListViewListener:Lcom/fortysevendeg/swipelistview/SwipeListViewListener;

    invoke-interface {v0, p1}, Lcom/fortysevendeg/swipelistview/SwipeListViewListener;->onDismiss([I)V

    .line 375
    :cond_0
    return-void
.end method

.method protected onFirstListItem()V
    .locals 1

    .prologue
    .line 482
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeListViewListener:Lcom/fortysevendeg/swipelistview/SwipeListViewListener;

    if-eqz v0, :cond_0

    .line 483
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeListViewListener:Lcom/fortysevendeg/swipelistview/SwipeListViewListener;

    invoke-interface {v0}, Lcom/fortysevendeg/swipelistview/SwipeListViewListener;->onFirstListItem()V

    .line 485
    :cond_0
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 7
    .parameter "ev"

    .prologue
    const/4 v6, 0x2

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 635
    invoke-static {p1}, Landroid/support/v4/view/MotionEventCompat;->getActionMasked(Landroid/view/MotionEvent;)I

    move-result v0

    .line 636
    .local v0, action:I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    .line 637
    .local v1, x:F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    .line 639
    .local v2, y:F
    invoke-virtual {p0}, Lcom/fortysevendeg/swipelistview/SwipeListView;->isEnabled()Z

    move-result v5

    if-eqz v5, :cond_2

    iget-object v5, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-virtual {v5}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->isSwipeEnabled()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 641
    iget v5, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchState:I

    if-ne v5, v3, :cond_1

    .line 642
    iget-object v3, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-virtual {v3, p0, p1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v3

    .line 667
    :cond_0
    :goto_0
    return v3

    .line 645
    :cond_1
    packed-switch v0, :pswitch_data_0

    .line 667
    :cond_2
    :goto_1
    invoke-super {p0, p1}, Landroid/widget/ListView;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v3

    goto :goto_0

    .line 647
    :pswitch_0
    invoke-direct {p0, v1, v2}, Lcom/fortysevendeg/swipelistview/SwipeListView;->checkInMoving(FF)V

    .line 648
    iget v5, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchState:I

    if-eq v5, v6, :cond_0

    move v3, v4

    goto :goto_0

    .line 650
    :pswitch_1
    invoke-super {p0, p1}, Landroid/widget/ListView;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 651
    iget-object v3, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-virtual {v3, p0, p1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 652
    iput v4, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchState:I

    .line 653
    iput v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->lastMotionX:F

    .line 654
    iput v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->lastMotionY:F

    move v3, v4

    .line 655
    goto :goto_0

    .line 657
    :pswitch_2
    iput v4, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchState:I

    goto :goto_1

    .line 660
    :pswitch_3
    iget-object v5, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-virtual {v5, p0, p1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 661
    iget v5, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchState:I

    if-eq v5, v6, :cond_0

    move v3, v4

    goto :goto_0

    .line 645
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_3
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method protected onLastListItem()V
    .locals 1

    .prologue
    .line 491
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeListViewListener:Lcom/fortysevendeg/swipelistview/SwipeListViewListener;

    if-eqz v0, :cond_0

    .line 492
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeListViewListener:Lcom/fortysevendeg/swipelistview/SwipeListViewListener;

    invoke-interface {v0}, Lcom/fortysevendeg/swipelistview/SwipeListViewListener;->onLastListItem()V

    .line 494
    :cond_0
    return-void
.end method

.method protected onListChanged()V
    .locals 1

    .prologue
    .line 500
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeListViewListener:Lcom/fortysevendeg/swipelistview/SwipeListViewListener;

    if-eqz v0, :cond_0

    .line 501
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeListViewListener:Lcom/fortysevendeg/swipelistview/SwipeListViewListener;

    invoke-interface {v0}, Lcom/fortysevendeg/swipelistview/SwipeListViewListener;->onListChanged()V

    .line 503
    :cond_0
    return-void
.end method

.method protected onMove(IF)V
    .locals 1
    .parameter "position"
    .parameter "x"

    .prologue
    .line 512
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeListViewListener:Lcom/fortysevendeg/swipelistview/SwipeListViewListener;

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    .line 513
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeListViewListener:Lcom/fortysevendeg/swipelistview/SwipeListViewListener;

    invoke-interface {v0, p1, p2}, Lcom/fortysevendeg/swipelistview/SwipeListViewListener;->onMove(IF)V

    .line 515
    :cond_0
    return-void
.end method

.method protected onOpened(IZ)V
    .locals 1
    .parameter "position"
    .parameter "toRight"

    .prologue
    .line 431
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeListViewListener:Lcom/fortysevendeg/swipelistview/SwipeListViewListener;

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    .line 432
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeListViewListener:Lcom/fortysevendeg/swipelistview/SwipeListViewListener;

    invoke-interface {v0, p1, p2}, Lcom/fortysevendeg/swipelistview/SwipeListViewListener;->onOpened(IZ)V

    .line 434
    :cond_0
    return-void
.end method

.method protected onStartClose(IZ)V
    .locals 1
    .parameter "position"
    .parameter "right"

    .prologue
    .line 397
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeListViewListener:Lcom/fortysevendeg/swipelistview/SwipeListViewListener;

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    .line 398
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeListViewListener:Lcom/fortysevendeg/swipelistview/SwipeListViewListener;

    invoke-interface {v0, p1, p2}, Lcom/fortysevendeg/swipelistview/SwipeListViewListener;->onStartClose(IZ)V

    .line 400
    :cond_0
    return-void
.end method

.method protected onStartOpen(IIZ)V
    .locals 1
    .parameter "position"
    .parameter "action"
    .parameter "right"

    .prologue
    .line 385
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeListViewListener:Lcom/fortysevendeg/swipelistview/SwipeListViewListener;

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    .line 386
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeListViewListener:Lcom/fortysevendeg/swipelistview/SwipeListViewListener;

    invoke-interface {v0, p1, p2, p3}, Lcom/fortysevendeg/swipelistview/SwipeListViewListener;->onStartOpen(IIZ)V

    .line 388
    :cond_0
    return-void
.end method

.method public openAnimate(I)V
    .locals 1
    .parameter "position"

    .prologue
    .line 354
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-virtual {v0, p1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->openAnimate(I)V

    .line 355
    return-void
.end method

.method public recycle(Landroid/view/View;I)V
    .locals 4
    .parameter "convertView"
    .parameter "position"

    .prologue
    .line 242
    iget-object v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    iget v3, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeFrontView:I

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v2, v3, p2}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->reloadChoiceStateInView(Landroid/view/View;I)V

    .line 243
    iget-object v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    iget v3, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeFrontView:I

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v2, v3, p2}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->reloadSwipeStateInView(Landroid/view/View;I)V

    .line 248
    const/4 v0, 0x0

    .local v0, j:I
    :goto_0
    move-object v2, p1

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_0

    move-object v2, p1

    .line 249
    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 250
    .local v1, nextChild:Landroid/view/View;
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setPressed(Z)V

    .line 248
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 252
    .end local v1           #nextChild:Landroid/view/View;
    :cond_0
    return-void
.end method

.method public resetScrolling()V
    .locals 1

    .prologue
    .line 537
    const/4 v0, 0x0

    iput v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchState:I

    .line 538
    return-void
.end method

.method public bridge synthetic setAdapter(Landroid/widget/Adapter;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 39
    check-cast p1, Landroid/widget/ListAdapter;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/fortysevendeg/swipelistview/SwipeListView;->setAdapter(Landroid/widget/ListAdapter;)V

    return-void
.end method

.method public setAdapter(Landroid/widget/ListAdapter;)V
    .locals 1
    .parameter "adapter"

    .prologue
    .line 294
    invoke-super {p0, p1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 295
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-virtual {v0}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->resetItems()V

    .line 296
    new-instance v0, Lcom/fortysevendeg/swipelistview/SwipeListView$1;

    invoke-direct {v0, p0}, Lcom/fortysevendeg/swipelistview/SwipeListView$1;-><init>(Lcom/fortysevendeg/swipelistview/SwipeListView;)V

    invoke-interface {p1, v0}, Landroid/widget/ListAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 305
    return-void
.end method

.method public setAnimationTime(J)V
    .locals 1
    .parameter "animationTime"

    .prologue
    .line 627
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-virtual {v0, p1, p2}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->setAnimationTime(J)V

    .line 628
    return-void
.end method

.method public setOffsetLeft(F)V
    .locals 1
    .parameter "offsetLeft"

    .prologue
    .line 555
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-virtual {v0, p1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->setLeftOffset(F)V

    .line 556
    return-void
.end method

.method public setOffsetRight(F)V
    .locals 1
    .parameter "offsetRight"

    .prologue
    .line 546
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-virtual {v0, p1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->setRightOffset(F)V

    .line 547
    return-void
.end method

.method public setSwipeActionLeft(I)V
    .locals 1
    .parameter "swipeActionLeft"

    .prologue
    .line 600
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-virtual {v0, p1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->setSwipeActionLeft(I)V

    .line 601
    return-void
.end method

.method public setSwipeActionRight(I)V
    .locals 1
    .parameter "swipeActionRight"

    .prologue
    .line 618
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-virtual {v0, p1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->setSwipeActionRight(I)V

    .line 619
    return-void
.end method

.method public setSwipeCloseAllItemsWhenMoveList(Z)V
    .locals 1
    .parameter "swipeCloseAllItemsWhenMoveList"

    .prologue
    .line 564
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-virtual {v0, p1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->setSwipeClosesAllItemsWhenListMoves(Z)V

    .line 565
    return-void
.end method

.method public setSwipeListViewListener(Lcom/fortysevendeg/swipelistview/SwipeListViewListener;)V
    .locals 0
    .parameter "swipeListViewListener"

    .prologue
    .line 530
    iput-object p1, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->swipeListViewListener:Lcom/fortysevendeg/swipelistview/SwipeListViewListener;

    .line 531
    return-void
.end method

.method public setSwipeMode(I)V
    .locals 1
    .parameter "swipeMode"

    .prologue
    .line 582
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-virtual {v0, p1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->setSwipeMode(I)V

    .line 583
    return-void
.end method

.method public setSwipeOpenOnLongPress(Z)V
    .locals 1
    .parameter "swipeOpenOnLongPress"

    .prologue
    .line 573
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-virtual {v0, p1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->setSwipeOpenOnLongPress(Z)V

    .line 574
    return-void
.end method

.method public unselectedChoiceStates()V
    .locals 1

    .prologue
    .line 286
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListView;->touchListener:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;

    invoke-virtual {v0}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->unselectedChoiceStates()V

    .line 287
    return-void
.end method
