.class final Lorg/eclipse/jgit/revwalk/BlockRevQueue$BlockFreeList;
.super Ljava/lang/Object;
.source "BlockRevQueue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/revwalk/BlockRevQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "BlockFreeList"
.end annotation


# instance fields
.field private next:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method clear()V
    .locals 1

    .prologue
    .line 108
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$BlockFreeList;->next:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    .line 109
    return-void
.end method

.method freeBlock(Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;)V
    .locals 1
    .parameter "b"

    .prologue
    .line 103
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$BlockFreeList;->next:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    iput-object v0, p1, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->next:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    .line 104
    iput-object p1, p0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$BlockFreeList;->next:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    .line 105
    return-void
.end method

.method newBlock()Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;
    .locals 2

    .prologue
    .line 94
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$BlockFreeList;->next:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    .line 95
    .local v0, b:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;
    if-nez v0, :cond_0

    .line 96
    new-instance v0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    .end local v0           #b:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;
    invoke-direct {v0}, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;-><init>()V

    .line 99
    :goto_0
    return-object v0

    .line 97
    .restart local v0       #b:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;
    :cond_0
    iget-object v1, v0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->next:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    iput-object v1, p0, Lorg/eclipse/jgit/revwalk/BlockRevQueue$BlockFreeList;->next:Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;

    .line 98
    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/BlockRevQueue$Block;->clear()V

    goto :goto_0
.end method
