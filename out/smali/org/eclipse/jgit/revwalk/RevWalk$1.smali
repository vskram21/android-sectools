.class Lorg/eclipse/jgit/revwalk/RevWalk$1;
.super Ljava/lang/Object;
.source "RevWalk.java"

# interfaces
.implements Lorg/eclipse/jgit/revwalk/AsyncRevObjectQueue;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Ljava/lang/Iterable;Z)Lorg/eclipse/jgit/revwalk/AsyncRevObjectQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/revwalk/RevWalk;

.field final synthetic val$objItr:Ljava/util/Iterator;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/revwalk/RevWalk;Ljava/util/Iterator;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 926
    iput-object p1, p0, Lorg/eclipse/jgit/revwalk/RevWalk$1;->this$0:Lorg/eclipse/jgit/revwalk/RevWalk;

    iput-object p2, p0, Lorg/eclipse/jgit/revwalk/RevWalk$1;->val$objItr:Ljava/util/Iterator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public cancel(Z)Z
    .locals 1
    .parameter "mayInterruptIfRunning"

    .prologue
    .line 932
    const/4 v0, 0x1

    return v0
.end method

.method public next()Lorg/eclipse/jgit/revwalk/RevObject;
    .locals 1

    .prologue
    .line 928
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk$1;->val$objItr:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk$1;->val$objItr:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/revwalk/RevObject;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public release()V
    .locals 0

    .prologue
    .line 937
    return-void
.end method
