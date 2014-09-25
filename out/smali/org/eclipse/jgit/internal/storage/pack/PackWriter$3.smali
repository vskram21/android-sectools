.class Lorg/eclipse/jgit/internal/storage/pack/PackWriter$3;
.super Ljava/lang/Object;
.source "PackWriter.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->searchForDeltas(Lorg/eclipse/jgit/lib/ProgressMonitor;)V
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
.field final synthetic this$0:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/pack/PackWriter;)V
    .locals 0
    .parameter

    .prologue
    .line 1253
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$3;->this$0:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 1253
    check-cast p1, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    .end local p1
    check-cast p2, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$3;->compare(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)I
    .locals 5
    .parameter "a"
    .parameter "b"

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 1255
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isDoNotDelta()Z

    move-result v1

    if-eqz v1, :cond_0

    move v1, v2

    :goto_0
    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isDoNotDelta()Z

    move-result v4

    if-eqz v4, :cond_1

    move v4, v2

    :goto_1
    sub-int v0, v1, v4

    .line 1257
    .local v0, cmp:I
    if-eqz v0, :cond_2

    move v1, v0

    .line 1276
    :goto_2
    return v1

    .end local v0           #cmp:I
    :cond_0
    move v1, v3

    .line 1255
    goto :goto_0

    :cond_1
    move v4, v3

    goto :goto_1

    .line 1260
    .restart local v0       #cmp:I
    :cond_2
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getType()I

    move-result v1

    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getType()I

    move-result v4

    sub-int v0, v1, v4

    .line 1261
    if-eqz v0, :cond_3

    move v1, v0

    .line 1262
    goto :goto_2

    .line 1264
    :cond_3
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getPathHash()I

    move-result v1

    ushr-int/lit8 v1, v1, 0x1

    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getPathHash()I

    move-result v4

    ushr-int/lit8 v4, v4, 0x1

    sub-int v0, v1, v4

    .line 1265
    if-eqz v0, :cond_4

    move v1, v0

    .line 1266
    goto :goto_2

    .line 1268
    :cond_4
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getPathHash()I

    move-result v1

    and-int/lit8 v1, v1, 0x1

    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getPathHash()I

    move-result v4

    and-int/lit8 v4, v4, 0x1

    sub-int v0, v1, v4

    .line 1269
    if-eqz v0, :cond_5

    move v1, v0

    .line 1270
    goto :goto_2

    .line 1272
    :cond_5
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isEdge()Z

    move-result v1

    if-eqz v1, :cond_6

    move v1, v3

    :goto_3
    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isEdge()Z

    move-result v4

    if-eqz v4, :cond_7

    :goto_4
    sub-int v0, v1, v3

    .line 1273
    if-eqz v0, :cond_8

    move v1, v0

    .line 1274
    goto :goto_2

    :cond_6
    move v1, v2

    .line 1272
    goto :goto_3

    :cond_7
    move v3, v2

    goto :goto_4

    .line 1276
    :cond_8
    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getWeight()I

    move-result v1

    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getWeight()I

    move-result v2

    sub-int/2addr v1, v2

    goto :goto_2
.end method
