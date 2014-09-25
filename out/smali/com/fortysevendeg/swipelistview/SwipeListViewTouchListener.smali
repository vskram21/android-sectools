.class public Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;
.super Ljava/lang/Object;
.source "SwipeListViewTouchListener.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$PendingDismissData;
    }
.end annotation


# static fields
.field private static final DISPLACE_CHOICE:I = 0x50


# instance fields
.field private animationTime:J

.field private backView:Landroid/view/View;

.field private checked:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private configShortAnimationTime:J

.field private dismissAnimationRefCount:I

.field private downPosition:I

.field private downX:F

.field private frontView:Landroid/view/View;

.field private leftOffset:F

.field private listViewMoving:Z

.field private maxFlingVelocity:I

.field private minFlingVelocity:I

.field private oldSwipeActionLeft:I

.field private oldSwipeActionRight:I

.field private opened:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private openedRight:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private parentView:Landroid/view/View;

.field private paused:Z

.field private pendingDismisses:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$PendingDismissData;",
            ">;"
        }
    .end annotation
.end field

.field private rect:Landroid/graphics/Rect;

.field private rightOffset:F

.field private slop:I

.field private swipeActionLeft:I

.field private swipeActionRight:I

.field private swipeBackView:I

.field private swipeClosesAllItemsWhenListMoves:Z

.field private swipeCurrentAction:I

.field private swipeDrawableChecked:I

.field private swipeDrawableUnchecked:I

.field private swipeFrontView:I

.field private swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

.field private swipeMode:I

.field private swipeOpenOnLongPress:Z

.field private swiping:Z

.field private swipingRight:Z

.field private velocityTracker:Landroid/view/VelocityTracker;

.field private viewWidth:I


# direct methods
.method public constructor <init>(Lcom/fortysevendeg/swipelistview/SwipeListView;II)V
    .locals 5
    .parameter "swipeListView"
    .parameter "swipeFrontView"
    .parameter "swipeBackView"

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput v3, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeMode:I

    .line 57
    iput-boolean v3, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeOpenOnLongPress:Z

    .line 58
    iput-boolean v3, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeClosesAllItemsWhenListMoves:Z

    .line 60
    iput v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeFrontView:I

    .line 61
    iput v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeBackView:I

    .line 63
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->rect:Landroid/graphics/Rect;

    .line 72
    iput v4, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->leftOffset:F

    .line 73
    iput v4, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->rightOffset:F

    .line 75
    iput v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeDrawableChecked:I

    .line 76
    iput v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeDrawableUnchecked:I

    .line 80
    iput v3, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->viewWidth:I

    .line 82
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->pendingDismisses:Ljava/util/List;

    .line 83
    iput v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->dismissAnimationRefCount:I

    .line 95
    const/4 v1, 0x3

    iput v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeCurrentAction:I

    .line 97
    iput v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeActionLeft:I

    .line 98
    iput v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeActionRight:I

    .line 100
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->opened:Ljava/util/List;

    .line 101
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->openedRight:Ljava/util/List;

    .line 103
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->checked:Ljava/util/List;

    .line 115
    iput p2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeFrontView:I

    .line 116
    iput p3, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeBackView:I

    .line 117
    invoke-virtual {p1}, Lcom/fortysevendeg/swipelistview/SwipeListView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    .line 118
    .local v0, vc:Landroid/view/ViewConfiguration;
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v1

    iput v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->slop:I

    .line 119
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v1

    iput v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->minFlingVelocity:I

    .line 120
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v1

    iput v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->maxFlingVelocity:I

    .line 121
    invoke-virtual {p1}, Lcom/fortysevendeg/swipelistview/SwipeListView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const/high16 v2, 0x10e

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    int-to-long v1, v1

    iput-wide v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->configShortAnimationTime:J

    .line 122
    iget-wide v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->configShortAnimationTime:J

    iput-wide v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->animationTime:J

    .line 123
    iput-object p1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    .line 124
    return-void
.end method

.method static synthetic access$000(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 52
    iget v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downPosition:I

    return v0
.end method

.method static synthetic access$002(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 52
    iput p1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downPosition:I

    return p1
.end method

.method static synthetic access$100(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;)Lcom/fortysevendeg/swipelistview/SwipeListView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 52
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    return-object v0
.end method

.method static synthetic access$200(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->resetCell()V

    return-void
.end method

.method static synthetic access$300(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;)Ljava/util/List;
    .locals 1
    .parameter "x0"

    .prologue
    .line 52
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->opened:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$400(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;)Ljava/util/List;
    .locals 1
    .parameter "x0"

    .prologue
    .line 52
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->openedRight:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$500(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 52
    iget-boolean v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeClosesAllItemsWhenListMoves:Z

    return v0
.end method

.method static synthetic access$602(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 52
    iput-boolean p1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->listViewMoving:Z

    return p1
.end method

.method static synthetic access$700(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 52
    iget v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->dismissAnimationRefCount:I

    return v0
.end method

.method static synthetic access$706(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 52
    iget v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->dismissAnimationRefCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->dismissAnimationRefCount:I

    return v0
.end method

.method static synthetic access$800(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->removePendingDismisses(I)V

    return-void
.end method

.method private closeAnimate(Landroid/view/View;I)V
    .locals 2
    .parameter "view"
    .parameter "position"

    .prologue
    .line 501
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->opened:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 502
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1, p2}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->generateRevealAnimate(Landroid/view/View;ZZI)V

    .line 504
    :cond_0
    return-void
.end method

.method public static enableDisableViewGroup(Landroid/view/ViewGroup;Z)V
    .locals 4
    .parameter "viewGroup"
    .parameter "enabled"

    .prologue
    .line 1111
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    .line 1112
    .local v0, childCount:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 1113
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 1114
    .local v2, view:Landroid/view/View;
    invoke-virtual {v2, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 1115
    instance-of v3, v2, Landroid/view/ViewGroup;

    if-eqz v3, :cond_0

    .line 1116
    check-cast v2, Landroid/view/ViewGroup;

    .end local v2           #view:Landroid/view/View;
    invoke-static {v2, p1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->enableDisableViewGroup(Landroid/view/ViewGroup;Z)V

    .line 1112
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1119
    :cond_1
    return-void
.end method

.method private generateAnimate(Landroid/view/View;ZZI)V
    .locals 2
    .parameter "view"
    .parameter "swap"
    .parameter "swapRight"
    .parameter "position"

    .prologue
    .line 518
    iget v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeCurrentAction:I

    if-nez v0, :cond_0

    .line 519
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->generateRevealAnimate(Landroid/view/View;ZZI)V

    .line 521
    :cond_0
    iget v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeCurrentAction:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 522
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->parentView:Landroid/view/View;

    invoke-direct {p0, v0, p2, p3, p4}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->generateDismissAnimate(Landroid/view/View;ZZI)V

    .line 524
    :cond_1
    iget v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeCurrentAction:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_2

    .line 525
    invoke-direct {p0, p1, p4}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->generateChoiceAnimate(Landroid/view/View;I)V

    .line 527
    :cond_2
    return-void
.end method

.method private generateChoiceAnimate(Landroid/view/View;I)V
    .locals 3
    .parameter "view"
    .parameter "position"

    .prologue
    .line 536
    invoke-static {p1}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->animate(Landroid/view/View;)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->translationX(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v0

    iget-wide v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->animationTime:J

    invoke-virtual {v0, v1, v2}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->setDuration(J)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$4;

    invoke-direct {v1, p0}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$4;-><init>(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;)V

    invoke-virtual {v0, v1}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->setListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    .line 546
    return-void
.end method

.method private generateDismissAnimate(Landroid/view/View;ZZI)V
    .locals 5
    .parameter "view"
    .parameter "swap"
    .parameter "swapRight"
    .parameter "position"

    .prologue
    .line 557
    const/4 v1, 0x0

    .line 558
    .local v1, moveTo:I
    iget-object v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->opened:Ljava/util/List;

    invoke-interface {v2, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 559
    if-nez p2, :cond_0

    .line 560
    iget-object v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->openedRight:Ljava/util/List;

    invoke-interface {v2, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_2

    iget v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->viewWidth:I

    int-to-float v2, v2

    iget v3, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->rightOffset:F

    sub-float/2addr v2, v3

    float-to-int v1, v2

    .line 568
    :cond_0
    :goto_0
    const/4 v0, 0x1

    .line 569
    .local v0, alpha:I
    if-eqz p2, :cond_1

    .line 570
    iget v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->dismissAnimationRefCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->dismissAnimationRefCount:I

    .line 571
    const/4 v0, 0x0

    .line 574
    :cond_1
    invoke-static {p1}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->animate(Landroid/view/View;)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v2

    int-to-float v3, v1

    invoke-virtual {v2, v3}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->translationX(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v2

    int-to-float v3, v0

    invoke-virtual {v2, v3}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->alpha(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v2

    iget-wide v3, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->animationTime:J

    invoke-virtual {v2, v3, v4}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->setDuration(J)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v2

    new-instance v3, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$5;

    invoke-direct {v3, p0, p2, p1, p4}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$5;-><init>(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;ZLandroid/view/View;I)V

    invoke-virtual {v2, v3}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->setListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    .line 589
    return-void

    .line 560
    .end local v0           #alpha:I
    :cond_2
    iget v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->viewWidth:I

    neg-int v2, v2

    int-to-float v2, v2

    iget v3, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->leftOffset:F

    add-float/2addr v2, v3

    float-to-int v1, v2

    goto :goto_0

    .line 563
    :cond_3
    if-eqz p2, :cond_0

    .line 564
    if-eqz p3, :cond_4

    iget v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->viewWidth:I

    int-to-float v2, v2

    iget v3, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->rightOffset:F

    sub-float/2addr v2, v3

    float-to-int v1, v2

    :goto_1
    goto :goto_0

    :cond_4
    iget v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->viewWidth:I

    neg-int v2, v2

    int-to-float v2, v2

    iget v3, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->leftOffset:F

    add-float/2addr v2, v3

    float-to-int v1, v2

    goto :goto_1
.end method

.method private generateRevealAnimate(Landroid/view/View;ZZI)V
    .locals 4
    .parameter "view"
    .parameter "swap"
    .parameter "swapRight"
    .parameter "position"

    .prologue
    .line 600
    const/4 v0, 0x0

    .line 601
    .local v0, moveTo:I
    iget-object v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->opened:Ljava/util/List;

    invoke-interface {v1, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 602
    if-nez p2, :cond_0

    .line 603
    iget-object v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->openedRight:Ljava/util/List;

    invoke-interface {v1, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_1

    iget v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->viewWidth:I

    int-to-float v1, v1

    iget v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->rightOffset:F

    sub-float/2addr v1, v2

    float-to-int v0, v1

    .line 611
    :cond_0
    :goto_0
    invoke-static {p1}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->animate(Landroid/view/View;)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v1

    int-to-float v2, v0

    invoke-virtual {v1, v2}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->translationX(F)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v1

    iget-wide v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->animationTime:J

    invoke-virtual {v1, v2, v3}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->setDuration(J)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    move-result-object v1

    new-instance v2, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$6;

    invoke-direct {v2, p0, p2, p4, p3}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$6;-><init>(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;ZIZ)V

    invoke-virtual {v1, v2}, Lcom/nineoldandroids/view/ViewPropertyAnimator;->setListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)Lcom/nineoldandroids/view/ViewPropertyAnimator;

    .line 631
    return-void

    .line 603
    :cond_1
    iget v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->viewWidth:I

    neg-int v1, v1

    int-to-float v1, v1

    iget v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->leftOffset:F

    add-float/2addr v1, v2

    float-to-int v0, v1

    goto :goto_0

    .line 606
    :cond_2
    if-eqz p2, :cond_0

    .line 607
    if-eqz p3, :cond_3

    iget v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->viewWidth:I

    int-to-float v1, v1

    iget v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->rightOffset:F

    sub-float/2addr v1, v2

    float-to-int v0, v1

    :goto_1
    goto :goto_0

    :cond_3
    iget v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->viewWidth:I

    neg-int v1, v1

    int-to-float v1, v1

    iget v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->leftOffset:F

    add-float/2addr v1, v2

    float-to-int v0, v1

    goto :goto_1
.end method

.method private openAnimate(Landroid/view/View;I)V
    .locals 2
    .parameter "view"
    .parameter "position"

    .prologue
    .line 489
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->opened:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    .line 490
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1, p2}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->generateRevealAnimate(Landroid/view/View;ZZI)V

    .line 492
    :cond_0
    return-void
.end method

.method private removePendingDismisses(I)V
    .locals 7
    .parameter "originalHeight"

    .prologue
    .line 1086
    iget-object v5, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->pendingDismisses:Ljava/util/List;

    invoke-static {v5}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 1088
    iget-object v5, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->pendingDismisses:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    new-array v0, v5, [I

    .line 1089
    .local v0, dismissPositions:[I
    iget-object v5, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->pendingDismisses:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    add-int/lit8 v1, v5, -0x1

    .local v1, i:I
    :goto_0
    if-ltz v1, :cond_0

    .line 1090
    iget-object v5, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->pendingDismisses:Ljava/util/List;

    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$PendingDismissData;

    iget v5, v5, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$PendingDismissData;->position:I

    aput v5, v0, v1

    .line 1089
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 1092
    :cond_0
    iget-object v5, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    invoke-virtual {v5, v0}, Lcom/fortysevendeg/swipelistview/SwipeListView;->onDismiss([I)V

    .line 1095
    iget-object v5, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->pendingDismisses:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_1
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$PendingDismissData;

    .line 1097
    .local v4, pendingDismiss:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$PendingDismissData;
    iget-object v5, v4, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$PendingDismissData;->view:Landroid/view/View;

    if-eqz v5, :cond_1

    .line 1098
    iget-object v5, v4, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$PendingDismissData;->view:Landroid/view/View;

    const/high16 v6, 0x3f80

    invoke-static {v5, v6}, Lcom/nineoldandroids/view/ViewHelper;->setAlpha(Landroid/view/View;F)V

    .line 1099
    iget-object v5, v4, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$PendingDismissData;->view:Landroid/view/View;

    const/4 v6, 0x0

    invoke-static {v5, v6}, Lcom/nineoldandroids/view/ViewHelper;->setTranslationX(Landroid/view/View;F)V

    .line 1100
    iget-object v5, v4, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$PendingDismissData;->view:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    .line 1101
    .local v3, lp:Landroid/view/ViewGroup$LayoutParams;
    iput p1, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 1102
    iget-object v5, v4, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$PendingDismissData;->view:Landroid/view/View;

    invoke-virtual {v5, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_1

    .line 1106
    .end local v3           #lp:Landroid/view/ViewGroup$LayoutParams;
    .end local v4           #pendingDismiss:Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$PendingDismissData;
    :cond_2
    invoke-virtual {p0}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->resetPendingDismisses()V

    .line 1108
    return-void
.end method

.method private resetCell()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    const/4 v3, -0x1

    .line 634
    iget v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downPosition:I

    if-eq v0, v3, :cond_1

    .line 635
    iget v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeCurrentAction:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 636
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->backView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 638
    :cond_0
    iget-object v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->frontView:Landroid/view/View;

    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->opened:Ljava/util/List;

    iget v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downPosition:I

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-virtual {v1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 639
    iget-object v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->frontView:Landroid/view/View;

    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->opened:Ljava/util/List;

    iget v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downPosition:I

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-virtual {v1, v0}, Landroid/view/View;->setLongClickable(Z)V

    .line 640
    iput-object v4, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->frontView:Landroid/view/View;

    .line 641
    iput-object v4, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->backView:Landroid/view/View;

    .line 642
    iput v3, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downPosition:I

    .line 644
    :cond_1
    return-void
.end method

.method private setActionsTo(I)V
    .locals 1
    .parameter "action"

    .prologue
    .line 931
    iget v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeActionRight:I

    iput v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->oldSwipeActionRight:I

    .line 932
    iget v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeActionLeft:I

    iput v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->oldSwipeActionLeft:I

    .line 933
    iput p1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeActionRight:I

    .line 934
    iput p1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeActionLeft:I

    .line 935
    return-void
.end method

.method private setBackView(Landroid/view/View;)V
    .locals 1
    .parameter "backView"

    .prologue
    .line 167
    iput-object p1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->backView:Landroid/view/View;

    .line 168
    new-instance v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$3;

    invoke-direct {v0, p0}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$3;-><init>(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 174
    return-void
.end method

.method private setFrontView(Landroid/view/View;)V
    .locals 1
    .parameter "frontView"

    .prologue
    .line 141
    iput-object p1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->frontView:Landroid/view/View;

    .line 142
    new-instance v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$1;

    invoke-direct {v0, p0}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$1;-><init>(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 148
    iget-boolean v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeOpenOnLongPress:Z

    if-eqz v0, :cond_0

    .line 149
    new-instance v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$2;

    invoke-direct {v0, p0}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$2;-><init>(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 159
    :cond_0
    return-void
.end method

.method private setParentView(Landroid/view/View;)V
    .locals 0
    .parameter "parentView"

    .prologue
    .line 132
    iput-object p1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->parentView:Landroid/view/View;

    .line 133
    return-void
.end method

.method private swapChoiceState(I)V
    .locals 7
    .parameter "position"

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 350
    invoke-virtual {p0}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->getCountSelected()I

    move-result v2

    .line 351
    .local v2, lastCount:I
    iget-object v3, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->checked:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 352
    .local v1, lastChecked:Z
    iget-object v6, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->checked:Ljava/util/List;

    if-nez v1, :cond_3

    move v3, v4

    :goto_0
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {v6, p1, v3}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 353
    if-eqz v1, :cond_4

    add-int/lit8 v0, v2, -0x1

    .line 354
    .local v0, count:I
    :goto_1
    if-nez v2, :cond_0

    if-ne v0, v4, :cond_0

    .line 355
    iget-object v3, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    invoke-virtual {v3}, Lcom/fortysevendeg/swipelistview/SwipeListView;->onChoiceStarted()V

    .line 356
    invoke-virtual {p0}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->closeOpenedItems()V

    .line 357
    const/4 v3, 0x2

    invoke-direct {p0, v3}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->setActionsTo(I)V

    .line 359
    :cond_0
    if-ne v2, v4, :cond_1

    if-nez v0, :cond_1

    .line 360
    iget-object v3, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    invoke-virtual {v3}, Lcom/fortysevendeg/swipelistview/SwipeListView;->onChoiceEnded()V

    .line 361
    invoke-virtual {p0}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->returnOldActions()V

    .line 363
    :cond_1
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0xb

    if-lt v3, v6, :cond_2

    .line 364
    iget-object v6, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    if-nez v1, :cond_5

    move v3, v4

    :goto_2
    invoke-virtual {v6, p1, v3}, Lcom/fortysevendeg/swipelistview/SwipeListView;->setItemChecked(IZ)V

    .line 366
    :cond_2
    iget-object v3, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    if-nez v1, :cond_6

    :goto_3
    invoke-virtual {v3, p1, v4}, Lcom/fortysevendeg/swipelistview/SwipeListView;->onChoiceChanged(IZ)V

    .line 367
    iget-object v3, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->frontView:Landroid/view/View;

    invoke-virtual {p0, v3, p1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->reloadChoiceStateInView(Landroid/view/View;I)V

    .line 368
    return-void

    .end local v0           #count:I
    :cond_3
    move v3, v5

    .line 352
    goto :goto_0

    .line 353
    :cond_4
    add-int/lit8 v0, v2, 0x1

    goto :goto_1

    .restart local v0       #count:I
    :cond_5
    move v3, v5

    .line 364
    goto :goto_2

    :cond_6
    move v4, v5

    .line 366
    goto :goto_3
.end method


# virtual methods
.method protected closeAnimate(I)V
    .locals 3
    .parameter "position"

    .prologue
    .line 337
    iget-object v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    iget-object v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    invoke-virtual {v2}, Lcom/fortysevendeg/swipelistview/SwipeListView;->getFirstVisiblePosition()I

    move-result v2

    sub-int v2, p1, v2

    invoke-virtual {v1, v2}, Lcom/fortysevendeg/swipelistview/SwipeListView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    iget v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeFrontView:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 339
    .local v0, child:Landroid/view/View;
    if-eqz v0, :cond_0

    .line 340
    invoke-direct {p0, v0, p1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->closeAnimate(Landroid/view/View;I)V

    .line 342
    :cond_0
    return-void
.end method

.method closeOpenedItems()V
    .locals 5

    .prologue
    .line 722
    iget-object v3, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->opened:Ljava/util/List;

    if-eqz v3, :cond_1

    .line 723
    iget-object v3, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    invoke-virtual {v3}, Lcom/fortysevendeg/swipelistview/SwipeListView;->getFirstVisiblePosition()I

    move-result v2

    .line 724
    .local v2, start:I
    iget-object v3, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    invoke-virtual {v3}, Lcom/fortysevendeg/swipelistview/SwipeListView;->getLastVisiblePosition()I

    move-result v0

    .line 725
    .local v0, end:I
    move v1, v2

    .local v1, i:I
    :goto_0
    if-gt v1, v0, :cond_1

    .line 726
    iget-object v3, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->opened:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 727
    iget-object v3, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    sub-int v4, v1, v2

    invoke-virtual {v3, v4}, Lcom/fortysevendeg/swipelistview/SwipeListView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    iget v4, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeFrontView:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-direct {p0, v3, v1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->closeAnimate(Landroid/view/View;I)V

    .line 725
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 732
    .end local v0           #end:I
    .end local v1           #i:I
    .end local v2           #start:I
    :cond_1
    return-void
.end method

.method protected dismiss(I)I
    .locals 7
    .parameter "position"

    .prologue
    const/4 v3, 0x0

    .line 392
    iget-object v4, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->opened:Ljava/util/List;

    invoke-interface {v4, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 393
    iget-object v4, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->checked:Ljava/util/List;

    invoke-interface {v4, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 394
    iget-object v4, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    invoke-virtual {v4}, Lcom/fortysevendeg/swipelistview/SwipeListView;->getFirstVisiblePosition()I

    move-result v1

    .line 395
    .local v1, start:I
    iget-object v4, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    invoke-virtual {v4}, Lcom/fortysevendeg/swipelistview/SwipeListView;->getLastVisiblePosition()I

    move-result v0

    .line 396
    .local v0, end:I
    iget-object v4, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    sub-int v5, p1, v1

    invoke-virtual {v4, v5}, Lcom/fortysevendeg/swipelistview/SwipeListView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 397
    .local v2, view:Landroid/view/View;
    iget v4, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->dismissAnimationRefCount:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->dismissAnimationRefCount:I

    .line 398
    if-lt p1, v1, :cond_0

    if-gt p1, v0, :cond_0

    .line 399
    invoke-virtual {p0, v2, p1, v3}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->performDismiss(Landroid/view/View;IZ)V

    .line 400
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v3

    .line 403
    :goto_0
    return v3

    .line 402
    :cond_0
    iget-object v4, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->pendingDismisses:Ljava/util/List;

    new-instance v5, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$PendingDismissData;

    const/4 v6, 0x0

    invoke-direct {v5, p0, p1, v6}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$PendingDismissData;-><init>(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;ILandroid/view/View;)V

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method protected getCountSelected()I
    .locals 3

    .prologue
    .line 455
    const/4 v0, 0x0

    .line 456
    .local v0, count:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    iget-object v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->checked:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 457
    iget-object v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->checked:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 458
    add-int/lit8 v0, v0, 0x1

    .line 456
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 464
    :cond_1
    return v0
.end method

.method protected getPositionsSelected()Ljava/util/List;
    .locals 3
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
    .line 473
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 474
    .local v1, list:Ljava/util/List;,"Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->checked:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 475
    iget-object v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->checked:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 476
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 474
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 479
    :cond_1
    return-object v1
.end method

.method public getSwipeActionLeft()I
    .locals 1

    .prologue
    .line 256
    iget v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeActionLeft:I

    return v0
.end method

.method public getSwipeActionRight()I
    .locals 1

    .prologue
    .line 274
    iget v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeActionRight:I

    return v0
.end method

.method protected handlerPendingDismisses(I)V
    .locals 6
    .parameter "originalHeight"

    .prologue
    .line 1068
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 1069
    .local v0, handler:Landroid/os/Handler;
    new-instance v1, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$11;

    invoke-direct {v1, p0, p1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$11;-><init>(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;I)V

    iget-wide v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->animationTime:J

    const-wide/16 v4, 0x64

    add-long/2addr v2, v4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1075
    return-void
.end method

.method protected isChecked(I)Z
    .locals 1
    .parameter "position"

    .prologue
    .line 446
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->checked:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->checked:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isListViewMoving()Z
    .locals 1

    .prologue
    .line 180
    iget-boolean v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->listViewMoving:Z

    return v0
.end method

.method protected isSwipeEnabled()Z
    .locals 1

    .prologue
    .line 247
    iget v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeMode:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public makeScrollListener()Landroid/widget/AbsListView$OnScrollListener;
    .locals 1

    .prologue
    .line 661
    new-instance v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$7;

    invoke-direct {v0, p0}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$7;-><init>(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;)V

    return-object v0
.end method

.method public move(F)V
    .locals 8
    .parameter "deltaX"

    .prologue
    const/high16 v7, -0x3d60

    const/4 v5, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v6, 0x0

    .line 948
    iget-object v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    iget v4, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downPosition:I

    invoke-virtual {v1, v4, p1}, Lcom/fortysevendeg/swipelistview/SwipeListView;->onMove(IF)V

    .line 949
    iget-object v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->frontView:Landroid/view/View;

    invoke-static {v1}, Lcom/nineoldandroids/view/ViewHelper;->getX(Landroid/view/View;)F

    move-result v0

    .line 950
    .local v0, posX:F
    iget-object v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->opened:Ljava/util/List;

    iget v4, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downPosition:I

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 951
    iget-object v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->openedRight:Ljava/util/List;

    iget v4, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downPosition:I

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_4

    iget v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->viewWidth:I

    neg-int v1, v1

    int-to-float v1, v1

    iget v4, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->rightOffset:F

    add-float/2addr v1, v4

    :goto_0
    add-float/2addr v0, v1

    .line 953
    :cond_0
    cmpl-float v1, v0, v6

    if-lez v1, :cond_1

    iget-boolean v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipingRight:Z

    if-nez v1, :cond_1

    .line 957
    iget-boolean v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipingRight:Z

    if-nez v1, :cond_5

    move v1, v2

    :goto_1
    iput-boolean v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipingRight:Z

    .line 958
    iget v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeActionRight:I

    iput v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeCurrentAction:I

    .line 959
    iget v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeCurrentAction:I

    if-ne v1, v5, :cond_6

    .line 960
    iget-object v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->backView:Landroid/view/View;

    const/16 v4, 0x8

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 965
    :cond_1
    :goto_2
    cmpg-float v1, v0, v6

    if-gez v1, :cond_2

    iget-boolean v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipingRight:Z

    if-eqz v1, :cond_2

    .line 969
    iget-boolean v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipingRight:Z

    if-nez v1, :cond_7

    move v1, v2

    :goto_3
    iput-boolean v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipingRight:Z

    .line 970
    iget v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeActionLeft:I

    iput v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeCurrentAction:I

    .line 971
    iget v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeCurrentAction:I

    if-ne v1, v5, :cond_8

    .line 972
    iget-object v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->backView:Landroid/view/View;

    const/16 v3, 0x8

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 977
    :cond_2
    :goto_4
    iget v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeCurrentAction:I

    if-ne v1, v2, :cond_9

    .line 978
    iget-object v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->parentView:Landroid/view/View;

    invoke-static {v1, p1}, Lcom/nineoldandroids/view/ViewHelper;->setTranslationX(Landroid/view/View;F)V

    .line 979
    iget-object v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->parentView:Landroid/view/View;

    const/high16 v2, 0x3f80

    const/high16 v3, 0x3f80

    const/high16 v4, 0x4000

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v5

    mul-float/2addr v4, v5

    iget v5, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->viewWidth:I

    int-to-float v5, v5

    div-float/2addr v4, v5

    sub-float/2addr v3, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v2

    invoke-static {v6, v2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    invoke-static {v1, v2}, Lcom/nineoldandroids/view/ViewHelper;->setAlpha(Landroid/view/View;F)V

    .line 991
    :cond_3
    :goto_5
    return-void

    .line 951
    :cond_4
    iget v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->viewWidth:I

    int-to-float v1, v1

    iget v4, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->leftOffset:F

    sub-float/2addr v1, v4

    goto :goto_0

    :cond_5
    move v1, v3

    .line 957
    goto :goto_1

    .line 962
    :cond_6
    iget-object v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->backView:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_2

    :cond_7
    move v1, v3

    .line 969
    goto :goto_3

    .line 974
    :cond_8
    iget-object v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->backView:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_4

    .line 981
    :cond_9
    iget v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeCurrentAction:I

    if-ne v1, v5, :cond_e

    .line 982
    iget-boolean v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipingRight:Z

    if-eqz v1, :cond_a

    cmpl-float v1, p1, v6

    if-lez v1, :cond_a

    const/high16 v1, 0x42a0

    cmpg-float v1, v0, v1

    if-ltz v1, :cond_d

    :cond_a
    iget-boolean v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipingRight:Z

    if-nez v1, :cond_b

    cmpg-float v1, p1, v6

    if-gez v1, :cond_b

    cmpl-float v1, v0, v7

    if-gtz v1, :cond_d

    :cond_b
    iget-boolean v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipingRight:Z

    if-eqz v1, :cond_c

    const/high16 v1, 0x42a0

    cmpg-float v1, p1, v1

    if-ltz v1, :cond_d

    :cond_c
    iget-boolean v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipingRight:Z

    if-nez v1, :cond_3

    cmpl-float v1, p1, v7

    if-lez v1, :cond_3

    .line 986
    :cond_d
    iget-object v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->frontView:Landroid/view/View;

    invoke-static {v1, p1}, Lcom/nineoldandroids/view/ViewHelper;->setTranslationX(Landroid/view/View;F)V

    goto :goto_5

    .line 989
    :cond_e
    iget-object v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->frontView:Landroid/view/View;

    invoke-static {v1, p1}, Lcom/nineoldandroids/view/ViewHelper;->setTranslationX(Landroid/view/View;F)V

    goto :goto_5
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 24
    .parameter "view"
    .parameter "motionEvent"

    .prologue
    .line 739
    invoke-virtual/range {p0 .. p0}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->isSwipeEnabled()Z

    move-result v20

    if-nez v20, :cond_0

    .line 740
    const/16 v20, 0x0

    .line 927
    :goto_0
    return v20

    .line 743
    :cond_0
    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->viewWidth:I

    move/from16 v20, v0

    const/16 v21, 0x2

    move/from16 v0, v20

    move/from16 v1, v21

    if-ge v0, v1, :cond_1

    .line 744
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/fortysevendeg/swipelistview/SwipeListView;->getWidth()I

    move-result v20

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->viewWidth:I

    .line 747
    :cond_1
    invoke-static/range {p2 .. p2}, Landroid/support/v4/view/MotionEventCompat;->getActionMasked(Landroid/view/MotionEvent;)I

    move-result v20

    packed-switch v20, :pswitch_data_0

    .line 927
    :cond_2
    :goto_1
    const/16 v20, 0x0

    goto :goto_0

    .line 749
    :pswitch_0
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->paused:Z

    move/from16 v20, v0

    if-eqz v20, :cond_3

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downPosition:I

    move/from16 v20, v0

    const/16 v21, -0x1

    move/from16 v0, v20

    move/from16 v1, v21

    if-eq v0, v1, :cond_3

    .line 750
    const/16 v20, 0x0

    goto :goto_0

    .line 752
    :cond_3
    const/16 v20, 0x3

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeCurrentAction:I

    .line 754
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/fortysevendeg/swipelistview/SwipeListView;->getChildCount()I

    move-result v7

    .line 755
    .local v7, childCount:I
    const/16 v20, 0x2

    move/from16 v0, v20

    new-array v12, v0, [I

    .line 756
    .local v12, listViewCoords:[I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v12}, Lcom/fortysevendeg/swipelistview/SwipeListView;->getLocationOnScreen([I)V

    .line 757
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v20

    move/from16 v0, v20

    float-to-int v0, v0

    move/from16 v20, v0

    const/16 v21, 0x0

    aget v21, v12, v21

    sub-int v18, v20, v21

    .line 758
    .local v18, x:I
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v20

    move/from16 v0, v20

    float-to-int v0, v0

    move/from16 v20, v0

    const/16 v21, 0x1

    aget v21, v12, v21

    sub-int v19, v20, v21

    .line 760
    .local v19, y:I
    const/4 v11, 0x0

    .local v11, i:I
    :goto_2
    if-ge v11, v7, :cond_4

    .line 761
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v11}, Lcom/fortysevendeg/swipelistview/SwipeListView;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 762
    .local v6, child:Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->rect:Landroid/graphics/Rect;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v6, v0}, Landroid/view/View;->getHitRect(Landroid/graphics/Rect;)V

    .line 764
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v6}, Lcom/fortysevendeg/swipelistview/SwipeListView;->getPositionForView(Landroid/view/View;)I

    move-result v8

    .line 767
    .local v8, childPosition:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/fortysevendeg/swipelistview/SwipeListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v0, v8}, Landroid/widget/ListAdapter;->isEnabled(I)Z

    move-result v20

    if-eqz v20, :cond_5

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/fortysevendeg/swipelistview/SwipeListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v0, v8}, Landroid/widget/ListAdapter;->getItemViewType(I)I

    move-result v20

    if-ltz v20, :cond_5

    const/4 v3, 0x1

    .line 769
    .local v3, allowSwipe:Z
    :goto_3
    if-eqz v3, :cond_8

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->rect:Landroid/graphics/Rect;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Rect;->contains(II)Z

    move-result v20

    if-eqz v20, :cond_8

    .line 770
    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->setParentView(Landroid/view/View;)V

    .line 771
    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeFrontView:I

    move/from16 v20, v0

    move/from16 v0, v20

    invoke-virtual {v6, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->setFrontView(Landroid/view/View;)V

    .line 773
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v20

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downX:F

    .line 774
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lcom/fortysevendeg/swipelistview/SwipeListView;->getHeaderViewsCount()I

    move-result v20

    sub-int v20, v8, v20

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downPosition:I

    .line 776
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->frontView:Landroid/view/View;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->opened:Ljava/util/List;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downPosition:I

    move/from16 v22, v0

    move-object/from16 v0, v20

    move/from16 v1, v22

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/Boolean;

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v20

    if-nez v20, :cond_6

    const/16 v20, 0x1

    :goto_4
    move-object/from16 v0, v21

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 777
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->frontView:Landroid/view/View;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->opened:Ljava/util/List;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downPosition:I

    move/from16 v22, v0

    move-object/from16 v0, v20

    move/from16 v1, v22

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/Boolean;

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v20

    if-nez v20, :cond_7

    const/16 v20, 0x1

    :goto_5
    move-object/from16 v0, v21

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/view/View;->setLongClickable(Z)V

    .line 779
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->velocityTracker:Landroid/view/VelocityTracker;

    .line 780
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->velocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 781
    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeBackView:I

    move/from16 v20, v0

    if-lez v20, :cond_4

    .line 782
    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeBackView:I

    move/from16 v20, v0

    move/from16 v0, v20

    invoke-virtual {v6, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->setBackView(Landroid/view/View;)V

    .line 787
    .end local v3           #allowSwipe:Z
    .end local v6           #child:Landroid/view/View;
    .end local v8           #childPosition:I
    :cond_4
    invoke-virtual/range {p1 .. p2}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 788
    const/16 v20, 0x1

    goto/16 :goto_0

    .line 767
    .restart local v6       #child:Landroid/view/View;
    .restart local v8       #childPosition:I
    :cond_5
    const/4 v3, 0x0

    goto/16 :goto_3

    .line 776
    .restart local v3       #allowSwipe:Z
    :cond_6
    const/16 v20, 0x0

    goto :goto_4

    .line 777
    :cond_7
    const/16 v20, 0x0

    goto :goto_5

    .line 760
    :cond_8
    add-int/lit8 v11, v11, 0x1

    goto/16 :goto_2

    .line 792
    .end local v3           #allowSwipe:Z
    .end local v6           #child:Landroid/view/View;
    .end local v7           #childCount:I
    .end local v8           #childPosition:I
    .end local v11           #i:I
    .end local v12           #listViewCoords:[I
    .end local v18           #x:I
    .end local v19           #y:I
    :pswitch_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->velocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v20, v0

    if-eqz v20, :cond_2

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swiping:Z

    move/from16 v20, v0

    if-eqz v20, :cond_2

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downPosition:I

    move/from16 v20, v0

    const/16 v21, -0x1

    move/from16 v0, v20

    move/from16 v1, v21

    if-eq v0, v1, :cond_2

    .line 796
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downX:F

    move/from16 v21, v0

    sub-float v10, v20, v21

    .line 797
    .local v10, deltaX:F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->velocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 798
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->velocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v20, v0

    const/16 v21, 0x3e8

    invoke-virtual/range {v20 .. v21}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 799
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->velocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/view/VelocityTracker;->getXVelocity()F

    move-result v20

    invoke-static/range {v20 .. v20}, Ljava/lang/Math;->abs(F)F

    move-result v16

    .line 800
    .local v16, velocityX:F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->opened:Ljava/util/List;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downPosition:I

    move/from16 v21, v0

    invoke-interface/range {v20 .. v21}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/Boolean;

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v20

    if-nez v20, :cond_a

    .line 801
    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeMode:I

    move/from16 v20, v0

    const/16 v21, 0x3

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_9

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->velocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/view/VelocityTracker;->getXVelocity()F

    move-result v20

    const/16 v21, 0x0

    cmpl-float v20, v20, v21

    if-lez v20, :cond_9

    .line 802
    const/16 v16, 0x0

    .line 804
    :cond_9
    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeMode:I

    move/from16 v20, v0

    const/16 v21, 0x2

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_a

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->velocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/view/VelocityTracker;->getXVelocity()F

    move-result v20

    const/16 v21, 0x0

    cmpg-float v20, v20, v21

    if-gez v20, :cond_a

    .line 805
    const/16 v16, 0x0

    .line 808
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->velocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v20

    invoke-static/range {v20 .. v20}, Ljava/lang/Math;->abs(F)F

    move-result v17

    .line 809
    .local v17, velocityY:F
    const/4 v13, 0x0

    .line 810
    .local v13, swap:Z
    const/4 v14, 0x0

    .line 811
    .local v14, swapRight:Z
    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->minFlingVelocity:I

    move/from16 v20, v0

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    cmpg-float v20, v20, v16

    if-gtz v20, :cond_11

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->maxFlingVelocity:I

    move/from16 v20, v0

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    cmpg-float v20, v16, v20

    if-gtz v20, :cond_11

    const/high16 v20, 0x4000

    mul-float v20, v20, v17

    cmpg-float v20, v20, v16

    if-gez v20, :cond_11

    .line 812
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->velocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/view/VelocityTracker;->getXVelocity()F

    move-result v20

    const/16 v21, 0x0

    cmpl-float v20, v20, v21

    if-lez v20, :cond_d

    const/4 v14, 0x1

    .line 816
    :goto_6
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipingRight:Z

    move/from16 v20, v0

    move/from16 v0, v20

    if-eq v14, v0, :cond_e

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeActionLeft:I

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeActionRight:I

    move/from16 v21, v0

    move/from16 v0, v20

    move/from16 v1, v21

    if-eq v0, v1, :cond_e

    .line 817
    const/4 v13, 0x0

    .line 831
    :cond_b
    :goto_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->frontView:Landroid/view/View;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downPosition:I

    move/from16 v21, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move/from16 v2, v21

    invoke-direct {v0, v1, v13, v14, v2}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->generateAnimate(Landroid/view/View;ZZI)V

    .line 832
    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeCurrentAction:I

    move/from16 v20, v0

    const/16 v21, 0x2

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_c

    .line 833
    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downPosition:I

    move/from16 v20, v0

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swapChoiceState(I)V

    .line 836
    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->velocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/view/VelocityTracker;->recycle()V

    .line 837
    const/16 v20, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->velocityTracker:Landroid/view/VelocityTracker;

    .line 838
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downX:F

    .line 844
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swiping:Z

    goto/16 :goto_1

    .line 812
    :cond_d
    const/4 v14, 0x0

    goto :goto_6

    .line 818
    :cond_e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->opened:Ljava/util/List;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downPosition:I

    move/from16 v21, v0

    invoke-interface/range {v20 .. v21}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/Boolean;

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v20

    if-eqz v20, :cond_f

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->openedRight:Ljava/util/List;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downPosition:I

    move/from16 v21, v0

    invoke-interface/range {v20 .. v21}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/Boolean;

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v20

    if-eqz v20, :cond_f

    if-eqz v14, :cond_f

    .line 819
    const/4 v13, 0x0

    goto/16 :goto_7

    .line 820
    :cond_f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->opened:Ljava/util/List;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downPosition:I

    move/from16 v21, v0

    invoke-interface/range {v20 .. v21}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/Boolean;

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v20

    if-eqz v20, :cond_10

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->openedRight:Ljava/util/List;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downPosition:I

    move/from16 v21, v0

    invoke-interface/range {v20 .. v21}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/Boolean;

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v20

    if-nez v20, :cond_10

    if-nez v14, :cond_10

    .line 821
    const/4 v13, 0x0

    goto/16 :goto_7

    .line 823
    :cond_10
    const/4 v13, 0x1

    goto/16 :goto_7

    .line 825
    :cond_11
    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->viewWidth:I

    move/from16 v21, v0

    div-int/lit8 v21, v21, 0x2

    move/from16 v0, v21

    int-to-float v0, v0

    move/from16 v21, v0

    cmpl-float v20, v20, v21

    if-lez v20, :cond_b

    .line 826
    const/4 v13, 0x1

    .line 827
    const/16 v20, 0x0

    cmpl-float v20, v10, v20

    if-lez v20, :cond_12

    const/4 v14, 0x1

    :goto_8
    goto/16 :goto_7

    :cond_12
    const/4 v14, 0x0

    goto :goto_8

    .line 849
    .end local v10           #deltaX:F
    .end local v13           #swap:Z
    .end local v14           #swapRight:Z
    .end local v16           #velocityX:F
    .end local v17           #velocityY:F
    :pswitch_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->velocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v20, v0

    if-eqz v20, :cond_2

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->paused:Z

    move/from16 v20, v0

    if-nez v20, :cond_2

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downPosition:I

    move/from16 v20, v0

    const/16 v21, -0x1

    move/from16 v0, v20

    move/from16 v1, v21

    if-eq v0, v1, :cond_2

    .line 853
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->velocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 854
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->velocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v20, v0

    const/16 v21, 0x3e8

    invoke-virtual/range {v20 .. v21}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 855
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->velocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/view/VelocityTracker;->getXVelocity()F

    move-result v20

    invoke-static/range {v20 .. v20}, Ljava/lang/Math;->abs(F)F

    move-result v16

    .line 856
    .restart local v16       #velocityX:F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->velocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v20

    invoke-static/range {v20 .. v20}, Ljava/lang/Math;->abs(F)F

    move-result v17

    .line 858
    .restart local v17       #velocityY:F
    invoke-virtual/range {p2 .. p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downX:F

    move/from16 v21, v0

    sub-float v10, v20, v21

    .line 859
    .restart local v10       #deltaX:F
    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v9

    .line 861
    .local v9, deltaMode:F
    move-object/from16 v0, p0

    iget v15, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeMode:I

    .line 862
    .local v15, swipeMode:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downPosition:I

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Lcom/fortysevendeg/swipelistview/SwipeListView;->changeSwipeMode(I)I

    move-result v5

    .line 863
    .local v5, changeSwipeMode:I
    if-ltz v5, :cond_13

    .line 864
    move v15, v5

    .line 867
    :cond_13
    if-nez v15, :cond_17

    .line 868
    const/4 v9, 0x0

    .line 884
    :cond_14
    :goto_9
    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->slop:I

    move/from16 v20, v0

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    cmpl-float v20, v9, v20

    if-lez v20, :cond_15

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeCurrentAction:I

    move/from16 v20, v0

    const/16 v21, 0x3

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_15

    cmpg-float v20, v17, v16

    if-gez v20, :cond_15

    .line 885
    const/16 v20, 0x1

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swiping:Z

    .line 886
    const/16 v20, 0x0

    cmpl-float v20, v10, v20

    if-lez v20, :cond_1b

    const/16 v20, 0x1

    :goto_a
    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipingRight:Z

    .line 890
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->opened:Ljava/util/List;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downPosition:I

    move/from16 v21, v0

    invoke-interface/range {v20 .. v21}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/Boolean;

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v20

    if-eqz v20, :cond_1c

    .line 891
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downPosition:I

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipingRight:Z

    move/from16 v22, v0

    invoke-virtual/range {v20 .. v22}, Lcom/fortysevendeg/swipelistview/SwipeListView;->onStartClose(IZ)V

    .line 892
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeCurrentAction:I

    .line 907
    :goto_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    invoke-virtual/range {v20 .. v21}, Lcom/fortysevendeg/swipelistview/SwipeListView;->requestDisallowInterceptTouchEvent(Z)V

    .line 908
    invoke-static/range {p2 .. p2}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v4

    .line 909
    .local v4, cancelEvent:Landroid/view/MotionEvent;
    invoke-static/range {p2 .. p2}, Landroid/support/v4/view/MotionEventCompat;->getActionIndex(Landroid/view/MotionEvent;)I

    move-result v20

    shl-int/lit8 v20, v20, 0x8

    or-int/lit8 v20, v20, 0x3

    move/from16 v0, v20

    invoke-virtual {v4, v0}, Landroid/view/MotionEvent;->setAction(I)V

    .line 911
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Lcom/fortysevendeg/swipelistview/SwipeListView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 912
    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeCurrentAction:I

    move/from16 v20, v0

    const/16 v21, 0x2

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_15

    .line 913
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->backView:Landroid/view/View;

    move-object/from16 v20, v0

    const/16 v21, 0x8

    invoke-virtual/range {v20 .. v21}, Landroid/view/View;->setVisibility(I)V

    .line 917
    .end local v4           #cancelEvent:Landroid/view/MotionEvent;
    :cond_15
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swiping:Z

    move/from16 v20, v0

    if-eqz v20, :cond_2

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downPosition:I

    move/from16 v20, v0

    const/16 v21, -0x1

    move/from16 v0, v20

    move/from16 v1, v21

    if-eq v0, v1, :cond_2

    .line 918
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->opened:Ljava/util/List;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downPosition:I

    move/from16 v21, v0

    invoke-interface/range {v20 .. v21}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/Boolean;

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v20

    if-eqz v20, :cond_16

    .line 919
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->openedRight:Ljava/util/List;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downPosition:I

    move/from16 v21, v0

    invoke-interface/range {v20 .. v21}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/Boolean;

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v20

    if-eqz v20, :cond_21

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->viewWidth:I

    move/from16 v20, v0

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->rightOffset:F

    move/from16 v21, v0

    sub-float v20, v20, v21

    :goto_c
    add-float v10, v10, v20

    .line 921
    :cond_16
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->move(F)V

    .line 922
    const/16 v20, 0x1

    goto/16 :goto_0

    .line 869
    :cond_17
    const/16 v20, 0x1

    move/from16 v0, v20

    if-eq v15, v0, :cond_14

    .line 870
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->opened:Ljava/util/List;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downPosition:I

    move/from16 v21, v0

    invoke-interface/range {v20 .. v21}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/Boolean;

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v20

    if-eqz v20, :cond_19

    .line 871
    const/16 v20, 0x3

    move/from16 v0, v20

    if-ne v15, v0, :cond_18

    const/16 v20, 0x0

    cmpg-float v20, v10, v20

    if-gez v20, :cond_18

    .line 872
    const/4 v9, 0x0

    goto/16 :goto_9

    .line 873
    :cond_18
    const/16 v20, 0x2

    move/from16 v0, v20

    if-ne v15, v0, :cond_14

    const/16 v20, 0x0

    cmpl-float v20, v10, v20

    if-lez v20, :cond_14

    .line 874
    const/4 v9, 0x0

    goto/16 :goto_9

    .line 877
    :cond_19
    const/16 v20, 0x3

    move/from16 v0, v20

    if-ne v15, v0, :cond_1a

    const/16 v20, 0x0

    cmpl-float v20, v10, v20

    if-lez v20, :cond_1a

    .line 878
    const/4 v9, 0x0

    goto/16 :goto_9

    .line 879
    :cond_1a
    const/16 v20, 0x2

    move/from16 v0, v20

    if-ne v15, v0, :cond_14

    const/16 v20, 0x0

    cmpg-float v20, v10, v20

    if-gez v20, :cond_14

    .line 880
    const/4 v9, 0x0

    goto/16 :goto_9

    .line 886
    :cond_1b
    const/16 v20, 0x0

    goto/16 :goto_a

    .line 894
    :cond_1c
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipingRight:Z

    move/from16 v20, v0

    if-eqz v20, :cond_1d

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeActionRight:I

    move/from16 v20, v0

    const/16 v21, 0x1

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_1d

    .line 895
    const/16 v20, 0x1

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeCurrentAction:I

    .line 905
    :goto_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->downPosition:I

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeCurrentAction:I

    move/from16 v22, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipingRight:Z

    move/from16 v23, v0

    invoke-virtual/range {v20 .. v23}, Lcom/fortysevendeg/swipelistview/SwipeListView;->onStartOpen(IIZ)V

    goto/16 :goto_b

    .line 896
    :cond_1d
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipingRight:Z

    move/from16 v20, v0

    if-nez v20, :cond_1e

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeActionLeft:I

    move/from16 v20, v0

    const/16 v21, 0x1

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_1e

    .line 897
    const/16 v20, 0x1

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeCurrentAction:I

    goto :goto_d

    .line 898
    :cond_1e
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipingRight:Z

    move/from16 v20, v0

    if-eqz v20, :cond_1f

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeActionRight:I

    move/from16 v20, v0

    const/16 v21, 0x2

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_1f

    .line 899
    const/16 v20, 0x2

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeCurrentAction:I

    goto :goto_d

    .line 900
    :cond_1f
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipingRight:Z

    move/from16 v20, v0

    if-nez v20, :cond_20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeActionLeft:I

    move/from16 v20, v0

    const/16 v21, 0x2

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_20

    .line 901
    const/16 v20, 0x2

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeCurrentAction:I

    goto :goto_d

    .line 903
    :cond_20
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeCurrentAction:I

    goto/16 :goto_d

    .line 919
    :cond_21
    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->viewWidth:I

    move/from16 v20, v0

    move/from16 v0, v20

    neg-int v0, v0

    move/from16 v20, v0

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->leftOffset:F

    move/from16 v21, v0

    add-float v20, v20, v21

    goto/16 :goto_c

    .line 747
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method protected openAnimate(I)V
    .locals 3
    .parameter "position"

    .prologue
    .line 324
    iget-object v1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    iget-object v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    invoke-virtual {v2}, Lcom/fortysevendeg/swipelistview/SwipeListView;->getFirstVisiblePosition()I

    move-result v2

    sub-int v2, p1, v2

    invoke-virtual {v1, v2}, Lcom/fortysevendeg/swipelistview/SwipeListView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    iget v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeFrontView:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 326
    .local v0, child:Landroid/view/View;
    if-eqz v0, :cond_0

    .line 327
    invoke-direct {p0, v0, p1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->openAnimate(Landroid/view/View;I)V

    .line 329
    :cond_0
    return-void
.end method

.method protected performDismiss(Landroid/view/View;IZ)V
    .locals 6
    .parameter "dismissView"
    .parameter "dismissPosition"
    .parameter "doPendingDismiss"

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 1019
    move-object v3, p1

    check-cast v3, Landroid/view/ViewGroup;

    invoke-static {v3, v4}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->enableDisableViewGroup(Landroid/view/ViewGroup;Z)V

    .line 1020
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 1021
    .local v1, lp:Landroid/view/ViewGroup$LayoutParams;
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v2

    .line 1023
    .local v2, originalHeight:I
    const/4 v3, 0x2

    new-array v3, v3, [I

    aput v2, v3, v4

    aput v5, v3, v5

    invoke-static {v3}, Lcom/nineoldandroids/animation/ValueAnimator;->ofInt([I)Lcom/nineoldandroids/animation/ValueAnimator;

    move-result-object v3

    iget-wide v4, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->animationTime:J

    invoke-virtual {v3, v4, v5}, Lcom/nineoldandroids/animation/ValueAnimator;->setDuration(J)Lcom/nineoldandroids/animation/ValueAnimator;

    move-result-object v0

    .line 1025
    .local v0, animator:Lcom/nineoldandroids/animation/ValueAnimator;
    if-eqz p3, :cond_0

    .line 1026
    new-instance v3, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$8;

    invoke-direct {v3, p0, v2}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$8;-><init>(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;I)V

    invoke-virtual {v0, v3}, Lcom/nineoldandroids/animation/ValueAnimator;->addListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)V

    .line 1037
    :cond_0
    new-instance v3, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$9;

    invoke-direct {v3, p0, p1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$9;-><init>(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;Landroid/view/View;)V

    invoke-virtual {v0, v3}, Lcom/nineoldandroids/animation/ValueAnimator;->addListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)V

    .line 1044
    new-instance v3, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$10;

    invoke-direct {v3, p0, v1, p1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$10;-><init>(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;Landroid/view/ViewGroup$LayoutParams;Landroid/view/View;)V

    invoke-virtual {v0, v3}, Lcom/nineoldandroids/animation/ValueAnimator;->addUpdateListener(Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 1052
    iget-object v3, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->pendingDismisses:Ljava/util/List;

    new-instance v4, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$PendingDismissData;

    invoke-direct {v4, p0, p2, p1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener$PendingDismissData;-><init>(Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;ILandroid/view/View;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1053
    invoke-virtual {v0}, Lcom/nineoldandroids/animation/ValueAnimator;->start()V

    .line 1054
    return-void
.end method

.method protected reloadChoiceStateInView(Landroid/view/View;I)V
    .locals 1
    .parameter "frontView"
    .parameter "position"

    .prologue
    .line 414
    invoke-virtual {p0, p2}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->isChecked(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 415
    iget v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeDrawableChecked:I

    if-lez v0, :cond_0

    iget v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeDrawableChecked:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 419
    :cond_0
    :goto_0
    return-void

    .line 417
    :cond_1
    iget v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeDrawableUnchecked:I

    if-lez v0, :cond_0

    iget v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeDrawableUnchecked:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_0
.end method

.method protected reloadSwipeStateInView(Landroid/view/View;I)V
    .locals 1
    .parameter "frontView"
    .parameter "position"

    .prologue
    .line 427
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->opened:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    .line 428
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/nineoldandroids/view/ViewHelper;->setTranslationX(Landroid/view/View;F)V

    .line 437
    :goto_0
    return-void

    .line 430
    :cond_0
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->openedRight:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 431
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    invoke-virtual {v0}, Lcom/fortysevendeg/swipelistview/SwipeListView;->getWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-static {p1, v0}, Lcom/nineoldandroids/view/ViewHelper;->setTranslationX(Landroid/view/View;F)V

    goto :goto_0

    .line 433
    :cond_1
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    invoke-virtual {v0}, Lcom/fortysevendeg/swipelistview/SwipeListView;->getWidth()I

    move-result v0

    neg-int v0, v0

    int-to-float v0, v0

    invoke-static {p1, v0}, Lcom/nineoldandroids/view/ViewHelper;->setTranslationX(Landroid/view/View;F)V

    goto :goto_0
.end method

.method public resetItems()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 308
    iget-object v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    invoke-virtual {v2}, Lcom/fortysevendeg/swipelistview/SwipeListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 309
    iget-object v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    invoke-virtual {v2}, Lcom/fortysevendeg/swipelistview/SwipeListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v2

    invoke-interface {v2}, Landroid/widget/ListAdapter;->getCount()I

    move-result v0

    .line 310
    .local v0, count:I
    iget-object v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->opened:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    .local v1, i:I
    :goto_0
    if-gt v1, v0, :cond_0

    .line 311
    iget-object v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->opened:Ljava/util/List;

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 312
    iget-object v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->openedRight:Ljava/util/List;

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 313
    iget-object v2, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->checked:Ljava/util/List;

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 310
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 316
    .end local v0           #count:I
    .end local v1           #i:I
    :cond_0
    return-void
.end method

.method protected resetPendingDismisses()V
    .locals 1

    .prologue
    .line 1060
    iget-object v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->pendingDismisses:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 1061
    return-void
.end method

.method protected returnOldActions()V
    .locals 1

    .prologue
    .line 938
    iget v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->oldSwipeActionRight:I

    iput v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeActionRight:I

    .line 939
    iget v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->oldSwipeActionLeft:I

    iput v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeActionLeft:I

    .line 940
    return-void
.end method

.method public setAnimationTime(J)V
    .locals 2
    .parameter "animationTime"

    .prologue
    .line 189
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-lez v0, :cond_0

    .line 190
    iput-wide p1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->animationTime:J

    .line 194
    :goto_0
    return-void

    .line 192
    :cond_0
    iget-wide v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->configShortAnimationTime:J

    iput-wide v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->animationTime:J

    goto :goto_0
.end method

.method public setEnabled(Z)V
    .locals 1
    .parameter "enabled"

    .prologue
    .line 652
    if-nez p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->paused:Z

    .line 653
    return-void

    .line 652
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setLeftOffset(F)V
    .locals 0
    .parameter "leftOffset"

    .prologue
    .line 211
    iput p1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->leftOffset:F

    .line 212
    return-void
.end method

.method public setRightOffset(F)V
    .locals 0
    .parameter "rightOffset"

    .prologue
    .line 202
    iput p1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->rightOffset:F

    .line 203
    return-void
.end method

.method public setSwipeActionLeft(I)V
    .locals 0
    .parameter "swipeActionLeft"

    .prologue
    .line 265
    iput p1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeActionLeft:I

    .line 266
    return-void
.end method

.method public setSwipeActionRight(I)V
    .locals 0
    .parameter "swipeActionRight"

    .prologue
    .line 283
    iput p1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeActionRight:I

    .line 284
    return-void
.end method

.method public setSwipeClosesAllItemsWhenListMoves(Z)V
    .locals 0
    .parameter "swipeClosesAllItemsWhenListMoves"

    .prologue
    .line 220
    iput-boolean p1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeClosesAllItemsWhenListMoves:Z

    .line 221
    return-void
.end method

.method protected setSwipeDrawableChecked(I)V
    .locals 0
    .parameter "swipeDrawableChecked"

    .prologue
    .line 292
    iput p1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeDrawableChecked:I

    .line 293
    return-void
.end method

.method protected setSwipeDrawableUnchecked(I)V
    .locals 0
    .parameter "swipeDrawableUnchecked"

    .prologue
    .line 301
    iput p1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeDrawableUnchecked:I

    .line 302
    return-void
.end method

.method public setSwipeMode(I)V
    .locals 0
    .parameter "swipeMode"

    .prologue
    .line 238
    iput p1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeMode:I

    .line 239
    return-void
.end method

.method public setSwipeOpenOnLongPress(Z)V
    .locals 0
    .parameter "swipeOpenOnLongPress"

    .prologue
    .line 229
    iput-boolean p1, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeOpenOnLongPress:Z

    .line 230
    return-void
.end method

.method protected unselectedChoiceStates()V
    .locals 5

    .prologue
    .line 374
    iget-object v3, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    invoke-virtual {v3}, Lcom/fortysevendeg/swipelistview/SwipeListView;->getFirstVisiblePosition()I

    move-result v2

    .line 375
    .local v2, start:I
    iget-object v3, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    invoke-virtual {v3}, Lcom/fortysevendeg/swipelistview/SwipeListView;->getLastVisiblePosition()I

    move-result v0

    .line 376
    .local v0, end:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    iget-object v3, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->checked:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_1

    .line 377
    iget-object v3, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->checked:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_0

    if-lt v1, v2, :cond_0

    if-gt v1, v0, :cond_0

    .line 378
    iget-object v3, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    sub-int v4, v1, v2

    invoke-virtual {v3, v4}, Lcom/fortysevendeg/swipelistview/SwipeListView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    iget v4, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeFrontView:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {p0, v3, v1}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->reloadChoiceStateInView(Landroid/view/View;I)V

    .line 380
    :cond_0
    iget-object v3, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->checked:Ljava/util/List;

    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-interface {v3, v1, v4}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 376
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 382
    :cond_1
    iget-object v3, p0, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->swipeListView:Lcom/fortysevendeg/swipelistview/SwipeListView;

    invoke-virtual {v3}, Lcom/fortysevendeg/swipelistview/SwipeListView;->onChoiceEnded()V

    .line 383
    invoke-virtual {p0}, Lcom/fortysevendeg/swipelistview/SwipeListViewTouchListener;->returnOldActions()V

    .line 384
    return-void
.end method
