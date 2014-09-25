.class final Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$PositionEntry;
.super Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;
.source "PackBitmapIndexBuilder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "PositionEntry"
.end annotation


# instance fields
.field private final namePosition:I

.field private offsetPosition:I


# direct methods
.method private constructor <init>(Lorg/eclipse/jgit/lib/AnyObjectId;I)V
    .locals 0
    .parameter "objectId"
    .parameter "namePosition"

    .prologue
    .line 345
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 346
    iput p2, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$PositionEntry;->namePosition:I

    .line 347
    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/lib/AnyObjectId;ILorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 339
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$PositionEntry;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;I)V

    return-void
.end method

.method static synthetic access$100(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$PositionEntry;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 339
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$PositionEntry;->offsetPosition:I

    return v0
.end method

.method static synthetic access$102(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$PositionEntry;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 339
    iput p1, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$PositionEntry;->offsetPosition:I

    return p1
.end method

.method static synthetic access$400(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$PositionEntry;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 339
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$PositionEntry;->namePosition:I

    return v0
.end method
