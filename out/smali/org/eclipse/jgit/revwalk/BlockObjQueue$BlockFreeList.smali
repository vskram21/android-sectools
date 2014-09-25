.class final Lorg/eclipse/jgit/revwalk/BlockObjQueue$BlockFreeList;
.super Ljava/lang/Object;
.source "BlockObjQueue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/revwalk/BlockObjQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "BlockFreeList"
.end annotation


# instance fields
.field private next:Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method freeBlock(Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;)V
    .locals 1
    .parameter "b"

    .prologue
    .line 102
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/BlockObjQueue$BlockFreeList;->next:Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;

    iput-object v0, p1, Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;->next:Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;

    .line 103
    iput-object p1, p0, Lorg/eclipse/jgit/revwalk/BlockObjQueue$BlockFreeList;->next:Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;

    .line 104
    return-void
.end method

.method newBlock()Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;
    .locals 2

    .prologue
    .line 93
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/BlockObjQueue$BlockFreeList;->next:Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;

    .line 94
    .local v0, b:Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;
    if-nez v0, :cond_0

    .line 95
    new-instance v0, Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;

    .end local v0           #b:Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;
    invoke-direct {v0}, Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;-><init>()V

    .line 98
    :goto_0
    return-object v0

    .line 96
    .restart local v0       #b:Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;
    :cond_0
    iget-object v1, v0, Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;->next:Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;

    iput-object v1, p0, Lorg/eclipse/jgit/revwalk/BlockObjQueue$BlockFreeList;->next:Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;

    .line 97
    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;->clear()V

    goto :goto_0
.end method
