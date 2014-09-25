.class Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$2;
.super Ljava/lang/Object;
.source "PackBitmapIndexBuilder.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->getCompressedBitmaps()Ljava/lang/Iterable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<",
        "Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$StoredEntry;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;)V
    .locals 0
    .parameter

    .prologue
    .line 253
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$2;->this$0:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$StoredEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 255
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$2$1;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$2$1;-><init>(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$2;)V

    return-object v0
.end method
