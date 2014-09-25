.class public Lcom/fortysevendeg/swipelistview/BaseSwipeListViewListener;
.super Ljava/lang/Object;
.source "BaseSwipeListViewListener.java"

# interfaces
.implements Lcom/fortysevendeg/swipelistview/SwipeListViewListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onChangeSwipeMode(I)I
    .locals 1
    .parameter "position"

    .prologue
    .line 42
    const/4 v0, -0x1

    return v0
.end method

.method public onChoiceChanged(IZ)V
    .locals 0
    .parameter "position"
    .parameter "selected"

    .prologue
    .line 47
    return-void
.end method

.method public onChoiceEnded()V
    .locals 0

    .prologue
    .line 55
    return-void
.end method

.method public onChoiceStarted()V
    .locals 0

    .prologue
    .line 51
    return-void
.end method

.method public onClickBackView(I)V
    .locals 0
    .parameter "position"

    .prologue
    .line 34
    return-void
.end method

.method public onClickFrontView(I)V
    .locals 0
    .parameter "position"

    .prologue
    .line 30
    return-void
.end method

.method public onClosed(IZ)V
    .locals 0
    .parameter "position"
    .parameter "fromRight"

    .prologue
    .line 10
    return-void
.end method

.method public onDismiss([I)V
    .locals 0
    .parameter "reverseSortedPositions"

    .prologue
    .line 38
    return-void
.end method

.method public onFirstListItem()V
    .locals 0

    .prologue
    .line 59
    return-void
.end method

.method public onLastListItem()V
    .locals 0

    .prologue
    .line 63
    return-void
.end method

.method public onListChanged()V
    .locals 0

    .prologue
    .line 14
    return-void
.end method

.method public onMove(IF)V
    .locals 0
    .parameter "position"
    .parameter "x"

    .prologue
    .line 18
    return-void
.end method

.method public onOpened(IZ)V
    .locals 0
    .parameter "position"
    .parameter "toRight"

    .prologue
    .line 6
    return-void
.end method

.method public onStartClose(IZ)V
    .locals 0
    .parameter "position"
    .parameter "right"

    .prologue
    .line 26
    return-void
.end method

.method public onStartOpen(IIZ)V
    .locals 0
    .parameter "position"
    .parameter "action"
    .parameter "right"

    .prologue
    .line 22
    return-void
.end method
