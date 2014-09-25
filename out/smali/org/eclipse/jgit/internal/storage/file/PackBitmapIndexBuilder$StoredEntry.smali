.class public final Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$StoredEntry;
.super Ljava/lang/Object;
.source "PackBitmapIndexBuilder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "StoredEntry"
.end annotation


# instance fields
.field private final bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

.field private final flags:I

.field private final objectId:J

.field private final xorOffset:I


# direct methods
.method private constructor <init>(JLcom/googlecode/javaewah/EWAHCompressedBitmap;II)V
    .locals 0
    .parameter "objectId"
    .parameter "bitmap"
    .parameter "xorOffset"
    .parameter "flags"

    .prologue
    .line 311
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 312
    iput-wide p1, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$StoredEntry;->objectId:J

    .line 313
    iput-object p3, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$StoredEntry;->bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 314
    iput p4, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$StoredEntry;->xorOffset:I

    .line 315
    iput p5, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$StoredEntry;->flags:I

    .line 316
    return-void
.end method

.method synthetic constructor <init>(JLcom/googlecode/javaewah/EWAHCompressedBitmap;IILorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"

    .prologue
    .line 304
    invoke-direct/range {p0 .. p5}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$StoredEntry;-><init>(JLcom/googlecode/javaewah/EWAHCompressedBitmap;II)V

    return-void
.end method


# virtual methods
.method public getBitmap()Lcom/googlecode/javaewah/EWAHCompressedBitmap;
    .locals 1

    .prologue
    .line 320
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$StoredEntry;->bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    return-object v0
.end method

.method public getFlags()I
    .locals 1

    .prologue
    .line 330
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$StoredEntry;->flags:I

    return v0
.end method

.method public getObjectId()J
    .locals 2

    .prologue
    .line 335
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$StoredEntry;->objectId:J

    return-wide v0
.end method

.method public getXorOffset()I
    .locals 1

    .prologue
    .line 325
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$StoredEntry;->xorOffset:I

    return v0
.end method
