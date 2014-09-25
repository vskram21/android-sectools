.class Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;
.super Ljava/lang/Object;
.source "PackParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/transport/PackParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DeltaVisit"
.end annotation


# instance fields
.field data:[B

.field final delta:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

.field id:Lorg/eclipse/jgit/lib/ObjectId;

.field nextChild:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

.field parent:Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 1565
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1566
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->delta:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    .line 1567
    return-void
.end method

.method constructor <init>(Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;)V
    .locals 1
    .parameter "parent"

    .prologue
    .line 1569
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1570
    iput-object p1, p0, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->parent:Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;

    .line 1571
    iget-object v0, p1, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->nextChild:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->delta:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    .line 1572
    iget-object v0, p0, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->delta:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    iget-object v0, v0, Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;->next:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    iput-object v0, p1, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->nextChild:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    .line 1573
    return-void
.end method


# virtual methods
.method next()Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 1577
    iget-object v1, p0, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->parent:Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->parent:Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;

    iget-object v1, v1, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->nextChild:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    if-nez v1, :cond_0

    .line 1578
    iget-object v1, p0, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->parent:Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;

    iput-object v0, v1, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->data:[B

    .line 1579
    iget-object v1, p0, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->parent:Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;

    iget-object v1, v1, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->parent:Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;

    iput-object v1, p0, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->parent:Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;

    .line 1582
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->nextChild:Lorg/eclipse/jgit/transport/PackParser$UnresolvedDelta;

    if-eqz v1, :cond_2

    .line 1583
    new-instance v0, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;-><init>(Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;)V

    .line 1589
    :cond_1
    :goto_0
    return-object v0

    .line 1587
    :cond_2
    iget-object v1, p0, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->parent:Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;

    if-eqz v1, :cond_1

    .line 1588
    new-instance v0, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;->parent:Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;-><init>(Lorg/eclipse/jgit/transport/PackParser$DeltaVisit;)V

    goto :goto_0
.end method
