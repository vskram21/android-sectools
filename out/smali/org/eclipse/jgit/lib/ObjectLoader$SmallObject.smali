.class public Lorg/eclipse/jgit/lib/ObjectLoader$SmallObject;
.super Lorg/eclipse/jgit/lib/ObjectLoader;
.source "ObjectLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/lib/ObjectLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SmallObject"
.end annotation


# instance fields
.field private final data:[B

.field private final type:I


# direct methods
.method public constructor <init>(I[B)V
    .locals 0
    .parameter "type"
    .parameter "data"

    .prologue
    .line 296
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/ObjectLoader;-><init>()V

    .line 297
    iput p1, p0, Lorg/eclipse/jgit/lib/ObjectLoader$SmallObject;->type:I

    .line 298
    iput-object p2, p0, Lorg/eclipse/jgit/lib/ObjectLoader$SmallObject;->data:[B

    .line 299
    return-void
.end method


# virtual methods
.method public getCachedBytes()[B
    .locals 1

    .prologue
    .line 318
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ObjectLoader$SmallObject;->data:[B

    return-object v0
.end method

.method public getSize()J
    .locals 2

    .prologue
    .line 308
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/ObjectLoader$SmallObject;->getCachedBytes()[B

    move-result-object v0

    array-length v0, v0

    int-to-long v0, v0

    return-wide v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 303
    iget v0, p0, Lorg/eclipse/jgit/lib/ObjectLoader$SmallObject;->type:I

    return v0
.end method

.method public isLarge()Z
    .locals 1

    .prologue
    .line 313
    const/4 v0, 0x0

    return v0
.end method

.method public openStream()Lorg/eclipse/jgit/lib/ObjectStream;
    .locals 1

    .prologue
    .line 323
    new-instance v0, Lorg/eclipse/jgit/lib/ObjectStream$SmallStream;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/lib/ObjectStream$SmallStream;-><init>(Lorg/eclipse/jgit/lib/ObjectLoader;)V

    return-object v0
.end method
