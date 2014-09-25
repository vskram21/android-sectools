.class Lorg/eclipse/jgit/transport/BasePackFetchConnection$1;
.super Lorg/eclipse/jgit/revwalk/filter/RevFilter;
.source "BasePackFetchConnection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/transport/BasePackFetchConnection;->negotiateBegin()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/transport/BasePackFetchConnection;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/BasePackFetchConnection;)V
    .locals 0
    .parameter

    .prologue
    .line 688
    iput-object p1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection$1;->this$0:Lorg/eclipse/jgit/transport/BasePackFetchConnection;

    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/filter/RevFilter;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 688
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/BasePackFetchConnection$1;->clone()Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lorg/eclipse/jgit/revwalk/filter/RevFilter;
    .locals 0

    .prologue
    .line 691
    return-object p0
.end method

.method public include(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/revwalk/RevCommit;)Z
    .locals 2
    .parameter "walker"
    .parameter "c"

    .prologue
    .line 696
    iget-object v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection$1;->this$0:Lorg/eclipse/jgit/transport/BasePackFetchConnection;

    iget-object v1, v1, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->COMMON:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {p2, v1}, Lorg/eclipse/jgit/revwalk/RevCommit;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v0

    .line 697
    .local v0, remoteKnowsIsCommon:Z
    iget-object v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection$1;->this$0:Lorg/eclipse/jgit/transport/BasePackFetchConnection;

    iget-object v1, v1, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->ADVERTISED:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {p2, v1}, Lorg/eclipse/jgit/revwalk/RevCommit;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 703
    iget-object v1, p0, Lorg/eclipse/jgit/transport/BasePackFetchConnection$1;->this$0:Lorg/eclipse/jgit/transport/BasePackFetchConnection;

    iget-object v1, v1, Lorg/eclipse/jgit/transport/BasePackFetchConnection;->COMMON:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {p2, v1}, Lorg/eclipse/jgit/revwalk/RevCommit;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 705
    :cond_0
    if-nez v0, :cond_1

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public requiresCommitBody()Z
    .locals 1

    .prologue
    .line 710
    const/4 v0, 0x0

    return v0
.end method
