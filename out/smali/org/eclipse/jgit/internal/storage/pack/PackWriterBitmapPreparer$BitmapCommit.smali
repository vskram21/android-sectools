.class final Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;
.super Lorg/eclipse/jgit/lib/ObjectId;
.source "PackWriterBitmapPreparer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "BitmapCommit"
.end annotation


# instance fields
.field private final flags:I

.field private final reuseWalker:Z


# direct methods
.method private constructor <init>(Lorg/eclipse/jgit/lib/AnyObjectId;ZI)V
    .locals 0
    .parameter "objectId"
    .parameter "reuseWalker"
    .parameter "flags"

    .prologue
    .line 324
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/lib/ObjectId;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 325
    iput-boolean p2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;->reuseWalker:Z

    .line 326
    iput p3, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;->flags:I

    .line 327
    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/lib/AnyObjectId;ZILorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 318
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;ZI)V

    return-void
.end method


# virtual methods
.method getFlags()I
    .locals 1

    .prologue
    .line 334
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;->flags:I

    return v0
.end method

.method isReuseWalker()Z
    .locals 1

    .prologue
    .line 330
    iget-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$BitmapCommit;->reuseWalker:Z

    return v0
.end method
