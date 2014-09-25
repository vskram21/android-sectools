.class Lorg/eclipse/jgit/revwalk/RevWalk$3;
.super Ljava/lang/Object;
.source "RevWalk.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/revwalk/RevWalk;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<",
        "Lorg/eclipse/jgit/revwalk/RevCommit;",
        ">;"
    }
.end annotation


# instance fields
.field next:Lorg/eclipse/jgit/revwalk/RevCommit;

.field final synthetic this$0:Lorg/eclipse/jgit/revwalk/RevWalk;

.field final synthetic val$first:Lorg/eclipse/jgit/revwalk/RevCommit;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/revwalk/RevCommit;)V
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 1266
    iput-object p1, p0, Lorg/eclipse/jgit/revwalk/RevWalk$3;->this$0:Lorg/eclipse/jgit/revwalk/RevWalk;

    iput-object p2, p0, Lorg/eclipse/jgit/revwalk/RevWalk$3;->val$first:Lorg/eclipse/jgit/revwalk/RevCommit;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1267
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk$3;->val$first:Lorg/eclipse/jgit/revwalk/RevCommit;

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk$3;->next:Lorg/eclipse/jgit/revwalk/RevCommit;

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .prologue
    .line 1270
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevWalk$3;->next:Lorg/eclipse/jgit/revwalk/RevCommit;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1266
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/RevWalk$3;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    return-object v0
.end method

.method public next()Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 3

    .prologue
    .line 1275
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/RevWalk$3;->next:Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 1276
    .local v1, r:Lorg/eclipse/jgit/revwalk/RevCommit;
    iget-object v2, p0, Lorg/eclipse/jgit/revwalk/RevWalk$3;->this$0:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v2

    iput-object v2, p0, Lorg/eclipse/jgit/revwalk/RevWalk$3;->next:Lorg/eclipse/jgit/revwalk/RevCommit;
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/MissingObjectException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/eclipse/jgit/errors/IncorrectObjectTypeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 1277
    return-object v1

    .line 1278
    .end local v1           #r:Lorg/eclipse/jgit/revwalk/RevCommit;
    :catch_0
    move-exception v0

    .line 1279
    .local v0, e:Lorg/eclipse/jgit/errors/MissingObjectException;
    new-instance v2, Lorg/eclipse/jgit/errors/RevWalkException;

    invoke-direct {v2, v0}, Lorg/eclipse/jgit/errors/RevWalkException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 1280
    .end local v0           #e:Lorg/eclipse/jgit/errors/MissingObjectException;
    :catch_1
    move-exception v0

    .line 1281
    .local v0, e:Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;
    new-instance v2, Lorg/eclipse/jgit/errors/RevWalkException;

    invoke-direct {v2, v0}, Lorg/eclipse/jgit/errors/RevWalkException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 1282
    .end local v0           #e:Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;
    :catch_2
    move-exception v0

    .line 1283
    .local v0, e:Ljava/io/IOException;
    new-instance v2, Lorg/eclipse/jgit/errors/RevWalkException;

    invoke-direct {v2, v0}, Lorg/eclipse/jgit/errors/RevWalkException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 1288
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
