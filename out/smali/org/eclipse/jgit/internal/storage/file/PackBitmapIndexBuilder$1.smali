.class Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$1;
.super Ljava/lang/Object;
.source "PackBitmapIndexBuilder.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->sortByOffset(Ljava/util/List;)[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;",
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
    .line 126
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$1;->this$0:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 126
    check-cast p1, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    .end local p1
    check-cast p2, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$1;->compare(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)I
    .locals 4
    .parameter "a"
    .parameter "b"

    .prologue
    .line 128
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getOffset()J

    move-result-wide v0

    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getOffset()J

    move-result-wide v2

    sub-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Long;->signum(J)I

    move-result v0

    return v0
.end method
