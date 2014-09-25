.class final Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$XorCompressedBitmap;
.super Ljava/lang/Object;
.source "BasePackBitmapIndex.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "XorCompressedBitmap"
.end annotation


# instance fields
.field final bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

.field final xorBitmap:Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;


# direct methods
.method constructor <init>(Lcom/googlecode/javaewah/EWAHCompressedBitmap;Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;)V
    .locals 0
    .parameter "b"
    .parameter "xb"

    .prologue
    .line 123
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 124
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$XorCompressedBitmap;->bitmap:Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    .line 125
    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$XorCompressedBitmap;->xorBitmap:Lorg/eclipse/jgit/internal/storage/file/BasePackBitmapIndex$StoredBitmap;

    .line 126
    return-void
.end method
