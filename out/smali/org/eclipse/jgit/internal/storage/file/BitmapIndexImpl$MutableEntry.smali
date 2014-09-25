.class final Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableEntry;
.super Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;
.source "BitmapIndexImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "MutableEntry"
.end annotation


# instance fields
.field private final position:I

.field private final type:I


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/lib/AnyObjectId;II)V
    .locals 0
    .parameter "objectId"
    .parameter "type"
    .parameter "position"

    .prologue
    .line 437
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 438
    iput p2, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableEntry;->type:I

    .line 439
    iput p3, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableEntry;->position:I

    .line 440
    return-void
.end method

.method static synthetic access$1700(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableEntry;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 431
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableEntry;->type:I

    return v0
.end method

.method static synthetic access$1800(Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableEntry;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 431
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/file/BitmapIndexImpl$MutableEntry;->position:I

    return v0
.end method
