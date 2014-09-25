.class Lorg/eclipse/jgit/revwalk/BlockObjQueue;
.super Ljava/lang/Object;
.source "BlockObjQueue.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;,
        Lorg/eclipse/jgit/revwalk/BlockObjQueue$BlockFreeList;
    }
.end annotation


# instance fields
.field private free:Lorg/eclipse/jgit/revwalk/BlockObjQueue$BlockFreeList;

.field private head:Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;

.field private tail:Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    new-instance v0, Lorg/eclipse/jgit/revwalk/BlockObjQueue$BlockFreeList;

    invoke-direct {v0}, Lorg/eclipse/jgit/revwalk/BlockObjQueue$BlockFreeList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/BlockObjQueue;->free:Lorg/eclipse/jgit/revwalk/BlockObjQueue$BlockFreeList;

    .line 56
    return-void
.end method


# virtual methods
.method add(Lorg/eclipse/jgit/revwalk/RevObject;)V
    .locals 2
    .parameter "c"

    .prologue
    .line 59
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/BlockObjQueue;->tail:Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;

    .line 60
    .local v0, b:Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;
    if-nez v0, :cond_0

    .line 61
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/BlockObjQueue;->free:Lorg/eclipse/jgit/revwalk/BlockObjQueue$BlockFreeList;

    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/BlockObjQueue$BlockFreeList;->newBlock()Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;

    move-result-object v0

    .line 62
    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;->add(Lorg/eclipse/jgit/revwalk/RevObject;)V

    .line 63
    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/BlockObjQueue;->head:Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;

    .line 64
    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/BlockObjQueue;->tail:Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;

    .line 72
    :goto_0
    return-void

    .line 66
    :cond_0
    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;->isFull()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 67
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/BlockObjQueue;->free:Lorg/eclipse/jgit/revwalk/BlockObjQueue$BlockFreeList;

    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/BlockObjQueue$BlockFreeList;->newBlock()Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;

    move-result-object v0

    .line 68
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/BlockObjQueue;->tail:Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;

    iput-object v0, v1, Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;->next:Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;

    .line 69
    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/BlockObjQueue;->tail:Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;

    .line 71
    :cond_1
    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;->add(Lorg/eclipse/jgit/revwalk/RevObject;)V

    goto :goto_0
.end method

.method next()Lorg/eclipse/jgit/revwalk/RevObject;
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 75
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/BlockObjQueue;->head:Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;

    .line 76
    .local v0, b:Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;
    if-nez v0, :cond_1

    move-object v1, v2

    .line 86
    :cond_0
    :goto_0
    return-object v1

    .line 79
    :cond_1
    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;->pop()Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v1

    .line 80
    .local v1, c:Lorg/eclipse/jgit/revwalk/RevObject;
    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 81
    iget-object v3, v0, Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;->next:Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;

    iput-object v3, p0, Lorg/eclipse/jgit/revwalk/BlockObjQueue;->head:Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;

    .line 82
    iget-object v3, p0, Lorg/eclipse/jgit/revwalk/BlockObjQueue;->head:Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;

    if-nez v3, :cond_2

    .line 83
    iput-object v2, p0, Lorg/eclipse/jgit/revwalk/BlockObjQueue;->tail:Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;

    .line 84
    :cond_2
    iget-object v2, p0, Lorg/eclipse/jgit/revwalk/BlockObjQueue;->free:Lorg/eclipse/jgit/revwalk/BlockObjQueue$BlockFreeList;

    invoke-virtual {v2, v0}, Lorg/eclipse/jgit/revwalk/BlockObjQueue$BlockFreeList;->freeBlock(Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;)V

    goto :goto_0
.end method
