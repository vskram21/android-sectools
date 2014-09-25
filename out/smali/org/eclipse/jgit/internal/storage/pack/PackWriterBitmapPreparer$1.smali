.class final Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$1;
.super Ljava/lang/Object;
.source "PackWriterBitmapPreparer.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 83
    check-cast p1, Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;

    .end local p1
    check-cast p2, Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapPreparer$1;->compare(Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;)I
    .locals 2
    .parameter "a"
    .parameter "b"

    .prologue
    .line 85
    invoke-interface {p2}, Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;->cardinality()I

    move-result v0

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;->cardinality()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->signum(I)I

    move-result v0

    return v0
.end method
