.class Lorg/eclipse/jgit/revwalk/RevWalk$2;
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

.field final synthetic val$lItr:Lorg/eclipse/jgit/lib/AsyncObjectLoaderQueue;

.field final synthetic val$objItr:Ljava/util/Iterator;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/revwalk/RevWalk;Ljava/util/Iterator;Lorg/eclipse/jgit/lib/AsyncObjectLoaderQueue;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 942
    iput-object p1, p0, Lorg/eclipse/jgit/revwalk/RevWalk$2;->this$0:Lorg/eclipse/jgit/revwalk/RevWalk;

    iput-object p2, p0, Lorg/eclipse/jgit/revwalk/RevWalk$2;->val$objItr:Ljava/util/Iterator;

    iput-object p3, p0, Lorg/eclipse/jgit/revwalk/RevWalk$2;->val$lItr:Lorg/eclipse/jgit/lib/AsyncObjectLoaderQueue;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public cancel(Z)Z
    .locals 1
    .parameter "mayInterruptIfRunning"

    .prologue
    .line 967
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk$2;->val$lItr:Lorg/eclipse/jgit/lib/AsyncObjectLoaderQueue;

    invoke-interface {v0, p1}, Lorg/eclipse/jgit/lib/AsyncObjectLoaderQueue;->cancel(Z)Z

    move-result v0

    return v0
.end method

.method public next()Lorg/eclipse/jgit/revwalk/RevObject;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 945
    iget-object v4, p0, Lorg/eclipse/jgit/revwalk/RevWalk$2;->val$objItr:Ljava/util/Iterator;

    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 946
    iget-object v4, p0, Lorg/eclipse/jgit/revwalk/RevWalk$2;->val$objItr:Ljava/util/Iterator;

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/revwalk/RevObject;

    .line 963
    :goto_0
    return-object v4

    .line 947
    :cond_0
    iget-object v4, p0, Lorg/eclipse/jgit/revwalk/RevWalk$2;->val$lItr:Lorg/eclipse/jgit/lib/AsyncObjectLoaderQueue;

    invoke-interface {v4}, Lorg/eclipse/jgit/lib/AsyncObjectLoaderQueue;->next()Z

    move-result v4

    if-nez v4, :cond_1

    .line 948
    const/4 v4, 0x0

    goto :goto_0

    .line 950
    :cond_1
    iget-object v4, p0, Lorg/eclipse/jgit/revwalk/RevWalk$2;->val$lItr:Lorg/eclipse/jgit/lib/AsyncObjectLoaderQueue;

    invoke-interface {v4}, Lorg/eclipse/jgit/lib/AsyncObjectLoaderQueue;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    .line 951
    .local v0, id:Lorg/eclipse/jgit/lib/ObjectId;
    iget-object v4, p0, Lorg/eclipse/jgit/revwalk/RevWalk$2;->val$lItr:Lorg/eclipse/jgit/lib/AsyncObjectLoaderQueue;

    invoke-interface {v4}, Lorg/eclipse/jgit/lib/AsyncObjectLoaderQueue;->open()Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v1

    .line 952
    .local v1, ldr:Lorg/eclipse/jgit/lib/ObjectLoader;
    iget-object v4, p0, Lorg/eclipse/jgit/revwalk/RevWalk$2;->this$0:Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v4, v4, Lorg/eclipse/jgit/revwalk/RevWalk;->objects:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    invoke-virtual {v4, v0}, Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;->get(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/revwalk/RevObject;

    .line 953
    .local v2, r:Lorg/eclipse/jgit/revwalk/RevObject;
    if-nez v2, :cond_2

    .line 954
    iget-object v4, p0, Lorg/eclipse/jgit/revwalk/RevWalk$2;->this$0:Lorg/eclipse/jgit/revwalk/RevWalk;

    #calls: Lorg/eclipse/jgit/revwalk/RevWalk;->parseNew(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectLoader;)Lorg/eclipse/jgit/revwalk/RevObject;
    invoke-static {v4, v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->access$000(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/ObjectLoader;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v2

    :goto_1
    move-object v4, v2

    .line 963
    goto :goto_0

    .line 955
    :cond_2
    instance-of v4, v2, Lorg/eclipse/jgit/revwalk/RevCommit;

    if-eqz v4, :cond_3

    .line 956
    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectLoader;->getCachedBytes()[B

    move-result-object v3

    .local v3, raw:[B
    move-object v4, v2

    .line 957
    check-cast v4, Lorg/eclipse/jgit/revwalk/RevCommit;

    iget-object v5, p0, Lorg/eclipse/jgit/revwalk/RevWalk$2;->this$0:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v4, v5, v3}, Lorg/eclipse/jgit/revwalk/RevCommit;->parseCanonical(Lorg/eclipse/jgit/revwalk/RevWalk;[B)V

    goto :goto_1

    .line 958
    .end local v3           #raw:[B
    :cond_3
    instance-of v4, v2, Lorg/eclipse/jgit/revwalk/RevTag;

    if-eqz v4, :cond_4

    .line 959
    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectLoader;->getCachedBytes()[B

    move-result-object v3

    .restart local v3       #raw:[B
    move-object v4, v2

    .line 960
    check-cast v4, Lorg/eclipse/jgit/revwalk/RevTag;

    iget-object v5, p0, Lorg/eclipse/jgit/revwalk/RevWalk$2;->this$0:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v4, v5, v3}, Lorg/eclipse/jgit/revwalk/RevTag;->parseCanonical(Lorg/eclipse/jgit/revwalk/RevWalk;[B)V

    goto :goto_1

    .line 962
    .end local v3           #raw:[B
    :cond_4
    iget v4, v2, Lorg/eclipse/jgit/revwalk/RevObject;->flags:I

    or-int/lit8 v4, v4, 0x1

    iput v4, v2, Lorg/eclipse/jgit/revwalk/RevObject;->flags:I

    goto :goto_1
.end method

.method public release()V
    .locals 1

    .prologue
    .line 971
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk$2;->val$lItr:Lorg/eclipse/jgit/lib/AsyncObjectLoaderQueue;

    invoke-interface {v0}, Lorg/eclipse/jgit/lib/AsyncObjectLoaderQueue;->release()V

    .line 972
    return-void
.end method
