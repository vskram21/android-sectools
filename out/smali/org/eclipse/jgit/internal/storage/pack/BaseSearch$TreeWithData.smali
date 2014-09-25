.class Lorg/eclipse/jgit/internal/storage/pack/BaseSearch$TreeWithData;
.super Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;
.source "BaseSearch.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/pack/BaseSearch;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TreeWithData"
.end annotation


# instance fields
.field final buf:[B


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/lib/AnyObjectId;[B)V
    .locals 0
    .parameter "id"
    .parameter "buf"

    .prologue
    .line 205
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 206
    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/pack/BaseSearch$TreeWithData;->buf:[B

    .line 207
    return-void
.end method
