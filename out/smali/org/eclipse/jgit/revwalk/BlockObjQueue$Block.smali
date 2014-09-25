.class final Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;
.super Ljava/lang/Object;
.source "BlockObjQueue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/revwalk/BlockObjQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Block"
.end annotation


# static fields
.field private static final BLOCK_SIZE:I = 0x100


# instance fields
.field headIndex:I

.field next:Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;

.field final objects:[Lorg/eclipse/jgit/revwalk/RevObject;

.field tailIndex:I


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 114
    const/16 v0, 0x100

    new-array v0, v0, [Lorg/eclipse/jgit/revwalk/RevObject;

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;->objects:[Lorg/eclipse/jgit/revwalk/RevObject;

    return-void
.end method


# virtual methods
.method add(Lorg/eclipse/jgit/revwalk/RevObject;)V
    .locals 3
    .parameter "c"

    .prologue
    .line 131
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;->objects:[Lorg/eclipse/jgit/revwalk/RevObject;

    iget v1, p0, Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;->tailIndex:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;->tailIndex:I

    aput-object p1, v0, v1

    .line 132
    return-void
.end method

.method clear()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 139
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;->next:Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;

    .line 140
    iput v1, p0, Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;->headIndex:I

    .line 141
    iput v1, p0, Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;->tailIndex:I

    .line 142
    return-void
.end method

.method isEmpty()Z
    .locals 2

    .prologue
    .line 127
    iget v0, p0, Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;->headIndex:I

    iget v1, p0, Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;->tailIndex:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method isFull()Z
    .locals 2

    .prologue
    .line 123
    iget v0, p0, Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;->tailIndex:I

    const/16 v1, 0x100

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method pop()Lorg/eclipse/jgit/revwalk/RevObject;
    .locals 3

    .prologue
    .line 135
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;->objects:[Lorg/eclipse/jgit/revwalk/RevObject;

    iget v1, p0, Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;->headIndex:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/eclipse/jgit/revwalk/BlockObjQueue$Block;->headIndex:I

    aget-object v0, v0, v1

    return-object v0
.end method
