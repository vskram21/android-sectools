.class Lorg/eclipse/jgit/transport/PackParser$DeltaChain;
.super Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;
.source "PackParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/PackParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DeltaChain"
.end annotation


# instance fields
.field head:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 0
    .parameter "id"

    .prologue
    .line 1511
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 1512
    return-void
.end method


# virtual methods
.method add(Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;)V
    .locals 1
    .parameter "d"

    .prologue
    .line 1522
    iget-object v0, p0, Lorg/eclipse/jgit/transport/PackParser$DeltaChain;->head:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    iput-object v0, p1, Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;->next:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    .line 1523
    iput-object p1, p0, Lorg/eclipse/jgit/transport/PackParser$DeltaChain;->head:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    .line 1524
    return-void
.end method

.method remove()Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;
    .locals 2

    .prologue
    .line 1515
    iget-object v0, p0, Lorg/eclipse/jgit/transport/PackParser$DeltaChain;->head:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    .line 1516
    .local v0, r:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;
    if-eqz v0, :cond_0

    .line 1517
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/eclipse/jgit/transport/PackParser$DeltaChain;->head:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    .line 1518
    :cond_0
    return-object v0
.end method
