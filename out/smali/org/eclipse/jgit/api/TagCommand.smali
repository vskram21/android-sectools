.class public Lorg/eclipse/jgit/api/TagCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "TagCommand.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/api/TagCommand$1;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/GitCommand",
        "<",
        "Lorg/eclipse/jgit/lib/Ref;",
        ">;"
    }
.end annotation


# instance fields
.field private annotated:Z

.field private forceUpdate:Z

.field private id:Lorg/eclipse/jgit/revwalk/RevObject;

.field private message:Ljava/lang/String;

.field private name:Ljava/lang/String;

.field private signed:Z

.field private tagger:Lorg/eclipse/jgit/lib/PersonIdent;


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "repo"

    .prologue
    .line 110
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/GitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 104
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/eclipse/jgit/api/TagCommand;->annotated:Z

    .line 111
    return-void
.end method

.method private processOptions(Lorg/eclipse/jgit/lib/RepositoryState;)V
    .locals 5
    .parameter "state"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/InvalidTagNameException;
        }
    .end annotation

    .prologue
    .line 222
    iget-object v0, p0, Lorg/eclipse/jgit/api/TagCommand;->tagger:Lorg/eclipse/jgit/lib/PersonIdent;

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lorg/eclipse/jgit/api/TagCommand;->annotated:Z

    if-eqz v0, :cond_0

    .line 223
    new-instance v0, Lorg/eclipse/jgit/lib/PersonIdent;

    iget-object v1, p0, Lorg/eclipse/jgit/api/TagCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/lib/PersonIdent;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    iput-object v0, p0, Lorg/eclipse/jgit/api/TagCommand;->tagger:Lorg/eclipse/jgit/lib/PersonIdent;

    .line 224
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/api/TagCommand;->name:Ljava/lang/String;

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "refs/tags/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/api/TagCommand;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Repository;->isValidRefName(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 225
    :cond_1
    new-instance v1, Lorg/eclipse/jgit/api/errors/InvalidTagNameException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v2, v0, Lorg/eclipse/jgit/internal/JGitText;->tagNameInvalid:Ljava/lang/String;

    const/4 v0, 0x1

    new-array v3, v0, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v0, p0, Lorg/eclipse/jgit/api/TagCommand;->name:Ljava/lang/String;

    if-nez v0, :cond_2

    const-string v0, "<null>"

    :goto_0
    aput-object v0, v3, v4

    invoke-static {v2, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lorg/eclipse/jgit/api/errors/InvalidTagNameException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_2
    iget-object v0, p0, Lorg/eclipse/jgit/api/TagCommand;->name:Ljava/lang/String;

    goto :goto_0

    .line 227
    :cond_3
    iget-boolean v0, p0, Lorg/eclipse/jgit/api/TagCommand;->signed:Z

    if-eqz v0, :cond_4

    .line 228
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->signingNotSupportedOnTag:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 230
    :cond_4
    return-void
.end method

.method private updateTagRef(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/revwalk/RevWalk;Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;
    .locals 8
    .parameter "tagId"
    .parameter "revWalk"
    .parameter "tagName"
    .parameter "newTagToString"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/api/errors/ConcurrentRefUpdateException;,
            Lorg/eclipse/jgit/api/errors/RefAlreadyExistsException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 184
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "refs/tags/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 185
    .local v0, refName:Ljava/lang/String;
    iget-object v3, p0, Lorg/eclipse/jgit/api/TagCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v3, v0}, Lorg/eclipse/jgit/lib/Repository;->updateRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefUpdate;

    move-result-object v1

    .line 186
    .local v1, tagRef:Lorg/eclipse/jgit/lib/RefUpdate;
    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/lib/RefUpdate;->setNewObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 187
    iget-boolean v3, p0, Lorg/eclipse/jgit/api/TagCommand;->forceUpdate:Z

    invoke-virtual {v1, v3}, Lorg/eclipse/jgit/lib/RefUpdate;->setForceUpdate(Z)V

    .line 188
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "tagged "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/eclipse/jgit/api/TagCommand;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3, v6}, Lorg/eclipse/jgit/lib/RefUpdate;->setRefLogMessage(Ljava/lang/String;Z)V

    .line 189
    invoke-virtual {v1, p2}, Lorg/eclipse/jgit/lib/RefUpdate;->update(Lorg/eclipse/jgit/revwalk/RevWalk;)Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v2

    .line 190
    .local v2, updateResult:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    sget-object v3, Lorg/eclipse/jgit/api/TagCommand$1;->$SwitchMap$org$eclipse$jgit$lib$RefUpdate$Result:[I

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/RefUpdate$Result;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 202
    new-instance v3, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->updatingRefFailed:Ljava/lang/String;

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v0, v5, v6

    aput-object p4, v5, v7

    const/4 v6, 0x2

    aput-object v2, v5, v6

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 193
    :pswitch_0
    iget-object v3, p0, Lorg/eclipse/jgit/api/TagCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v3, v0}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v3

    return-object v3

    .line 195
    :pswitch_1
    new-instance v3, Lorg/eclipse/jgit/api/errors/ConcurrentRefUpdateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->couldNotLockHEAD:Ljava/lang/String;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/RefUpdate;->getRef()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v5

    invoke-direct {v3, v4, v5, v2}, Lorg/eclipse/jgit/api/errors/ConcurrentRefUpdateException;-><init>(Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/lib/RefUpdate$Result;)V

    throw v3

    .line 199
    :pswitch_2
    new-instance v3, Lorg/eclipse/jgit/api/errors/RefAlreadyExistsException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->tagAlreadyExists:Ljava/lang/String;

    new-array v5, v7, [Ljava/lang/Object;

    aput-object p4, v5, v6

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/api/errors/RefAlreadyExistsException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 190
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 91
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/TagCommand;->call()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    return-object v0
.end method

.method public call()Lorg/eclipse/jgit/lib/Ref;
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;,
            Lorg/eclipse/jgit/api/errors/ConcurrentRefUpdateException;,
            Lorg/eclipse/jgit/api/errors/InvalidTagNameException;,
            Lorg/eclipse/jgit/api/errors/NoHeadException;
        }
    .end annotation

    .prologue
    .line 126
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/TagCommand;->checkCallable()V

    .line 128
    iget-object v8, p0, Lorg/eclipse/jgit/api/TagCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v8}, Lorg/eclipse/jgit/lib/Repository;->getRepositoryState()Lorg/eclipse/jgit/lib/RepositoryState;

    move-result-object v5

    .line 129
    .local v5, state:Lorg/eclipse/jgit/lib/RepositoryState;
    invoke-direct {p0, v5}, Lorg/eclipse/jgit/api/TagCommand;->processOptions(Lorg/eclipse/jgit/lib/RepositoryState;)V

    .line 131
    new-instance v4, Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v8, p0, Lorg/eclipse/jgit/api/TagCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v4, v8}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 134
    .local v4, revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    :try_start_0
    iget-object v8, p0, Lorg/eclipse/jgit/api/TagCommand;->id:Lorg/eclipse/jgit/revwalk/RevObject;

    if-nez v8, :cond_1

    .line 135
    iget-object v8, p0, Lorg/eclipse/jgit/api/TagCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const-string v9, "HEAD^{commit}"

    invoke-virtual {v8, v9}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    .line 136
    .local v3, objectId:Lorg/eclipse/jgit/lib/ObjectId;
    if-nez v3, :cond_0

    .line 137
    new-instance v8, Lorg/eclipse/jgit/api/errors/NoHeadException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v9

    iget-object v9, v9, Lorg/eclipse/jgit/internal/JGitText;->tagOnRepoWithoutHEADCurrentlyNotSupported:Ljava/lang/String;

    invoke-direct {v8, v9}, Lorg/eclipse/jgit/api/errors/NoHeadException;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 172
    .end local v3           #objectId:Lorg/eclipse/jgit/lib/ObjectId;
    :catch_0
    move-exception v0

    .line 173
    .local v0, e:Ljava/io/IOException;
    :try_start_1
    new-instance v8, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v9

    iget-object v9, v9, Lorg/eclipse/jgit/internal/JGitText;->exceptionCaughtDuringExecutionOfTagCommand:Ljava/lang/String;

    invoke-direct {v8, v9, v0}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 177
    .end local v0           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v8

    invoke-virtual {v4}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    throw v8

    .line 140
    .restart local v3       #objectId:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_0
    :try_start_2
    invoke-virtual {v4, v3}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v8

    iput-object v8, p0, Lorg/eclipse/jgit/api/TagCommand;->id:Lorg/eclipse/jgit/revwalk/RevObject;

    .line 143
    .end local v3           #objectId:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_1
    iget-boolean v8, p0, Lorg/eclipse/jgit/api/TagCommand;->annotated:Z

    if-nez v8, :cond_4

    .line 144
    iget-object v8, p0, Lorg/eclipse/jgit/api/TagCommand;->message:Ljava/lang/String;

    if-nez v8, :cond_2

    iget-object v8, p0, Lorg/eclipse/jgit/api/TagCommand;->tagger:Lorg/eclipse/jgit/lib/PersonIdent;

    if-eqz v8, :cond_3

    .line 145
    :cond_2
    new-instance v8, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v9

    iget-object v9, v9, Lorg/eclipse/jgit/internal/JGitText;->messageAndTaggerNotAllowedInUnannotatedTags:Ljava/lang/String;

    invoke-direct {v8, v9}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 147
    :cond_3
    iget-object v8, p0, Lorg/eclipse/jgit/api/TagCommand;->id:Lorg/eclipse/jgit/revwalk/RevObject;

    iget-object v9, p0, Lorg/eclipse/jgit/api/TagCommand;->name:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "SimpleTag["

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lorg/eclipse/jgit/api/TagCommand;->name:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " : "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lorg/eclipse/jgit/api/TagCommand;->id:Lorg/eclipse/jgit/revwalk/RevObject;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "]"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {p0, v8, v4, v9, v10}, Lorg/eclipse/jgit/api/TagCommand;->updateTagRef(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/revwalk/RevWalk;Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v8

    .line 177
    invoke-virtual {v4}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    :goto_0
    return-object v8

    .line 153
    :cond_4
    :try_start_3
    new-instance v2, Lorg/eclipse/jgit/lib/TagBuilder;

    invoke-direct {v2}, Lorg/eclipse/jgit/lib/TagBuilder;-><init>()V

    .line 154
    .local v2, newTag:Lorg/eclipse/jgit/lib/TagBuilder;
    iget-object v8, p0, Lorg/eclipse/jgit/api/TagCommand;->name:Ljava/lang/String;

    invoke-virtual {v2, v8}, Lorg/eclipse/jgit/lib/TagBuilder;->setTag(Ljava/lang/String;)V

    .line 155
    iget-object v8, p0, Lorg/eclipse/jgit/api/TagCommand;->message:Ljava/lang/String;

    invoke-virtual {v2, v8}, Lorg/eclipse/jgit/lib/TagBuilder;->setMessage(Ljava/lang/String;)V

    .line 156
    iget-object v8, p0, Lorg/eclipse/jgit/api/TagCommand;->tagger:Lorg/eclipse/jgit/lib/PersonIdent;

    invoke-virtual {v2, v8}, Lorg/eclipse/jgit/lib/TagBuilder;->setTagger(Lorg/eclipse/jgit/lib/PersonIdent;)V

    .line 157
    iget-object v8, p0, Lorg/eclipse/jgit/api/TagCommand;->id:Lorg/eclipse/jgit/revwalk/RevObject;

    invoke-virtual {v2, v8}, Lorg/eclipse/jgit/lib/TagBuilder;->setObjectId(Lorg/eclipse/jgit/revwalk/RevObject;)V

    .line 160
    iget-object v8, p0, Lorg/eclipse/jgit/api/TagCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v8}, Lorg/eclipse/jgit/lib/Repository;->newObjectInserter()Lorg/eclipse/jgit/lib/ObjectInserter;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    move-result-object v1

    .line 162
    .local v1, inserter:Lorg/eclipse/jgit/lib/ObjectInserter;
    :try_start_4
    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/ObjectInserter;->insert(Lorg/eclipse/jgit/lib/TagBuilder;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v7

    .line 163
    .local v7, tagId:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectInserter;->flush()V

    .line 165
    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/TagBuilder;->getTag()Ljava/lang/String;

    move-result-object v6

    .line 166
    .local v6, tag:Ljava/lang/String;
    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/TagBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v7, v4, v6, v8}, Lorg/eclipse/jgit/api/TagCommand;->updateTagRef(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/revwalk/RevWalk;Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    move-result-object v8

    .line 169
    :try_start_5
    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectInserter;->release()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0

    .line 177
    invoke-virtual {v4}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    goto :goto_0

    .line 169
    .end local v6           #tag:Ljava/lang/String;
    .end local v7           #tagId:Lorg/eclipse/jgit/lib/ObjectId;
    :catchall_1
    move-exception v8

    :try_start_6
    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectInserter;->release()V

    throw v8
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 254
    iget-object v0, p0, Lorg/eclipse/jgit/api/TagCommand;->message:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 247
    iget-object v0, p0, Lorg/eclipse/jgit/api/TagCommand;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getObjectId()Lorg/eclipse/jgit/revwalk/RevObject;
    .locals 1

    .prologue
    .line 310
    iget-object v0, p0, Lorg/eclipse/jgit/api/TagCommand;->id:Lorg/eclipse/jgit/revwalk/RevObject;

    return-object v0
.end method

.method public getTagger()Lorg/eclipse/jgit/lib/PersonIdent;
    .locals 1

    .prologue
    .line 303
    iget-object v0, p0, Lorg/eclipse/jgit/api/TagCommand;->tagger:Lorg/eclipse/jgit/lib/PersonIdent;

    return-object v0
.end method

.method public isAnnotated()Z
    .locals 1

    .prologue
    .line 360
    iget-boolean v0, p0, Lorg/eclipse/jgit/api/TagCommand;->annotated:Z

    return v0
.end method

.method public isForceUpdate()Z
    .locals 1

    .prologue
    .line 329
    iget-boolean v0, p0, Lorg/eclipse/jgit/api/TagCommand;->forceUpdate:Z

    return v0
.end method

.method public isSigned()Z
    .locals 1

    .prologue
    .line 272
    iget-boolean v0, p0, Lorg/eclipse/jgit/api/TagCommand;->signed:Z

    return v0
.end method

.method public setAnnotated(Z)Lorg/eclipse/jgit/api/TagCommand;
    .locals 0
    .parameter "annotated"

    .prologue
    .line 350
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/TagCommand;->annotated:Z

    .line 351
    return-object p0
.end method

.method public setForceUpdate(Z)Lorg/eclipse/jgit/api/TagCommand;
    .locals 0
    .parameter "forceUpdate"

    .prologue
    .line 340
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/TagCommand;->forceUpdate:Z

    .line 341
    return-object p0
.end method

.method public setMessage(Ljava/lang/String;)Lorg/eclipse/jgit/api/TagCommand;
    .locals 0
    .parameter "message"

    .prologue
    .line 263
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/TagCommand;->checkCallable()V

    .line 264
    iput-object p1, p0, Lorg/eclipse/jgit/api/TagCommand;->message:Ljava/lang/String;

    .line 265
    return-object p0
.end method

.method public setName(Ljava/lang/String;)Lorg/eclipse/jgit/api/TagCommand;
    .locals 0
    .parameter "name"

    .prologue
    .line 238
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/TagCommand;->checkCallable()V

    .line 239
    iput-object p1, p0, Lorg/eclipse/jgit/api/TagCommand;->name:Ljava/lang/String;

    .line 240
    return-object p0
.end method

.method public setObjectId(Lorg/eclipse/jgit/revwalk/RevObject;)Lorg/eclipse/jgit/api/TagCommand;
    .locals 0
    .parameter "id"

    .prologue
    .line 321
    iput-object p1, p0, Lorg/eclipse/jgit/api/TagCommand;->id:Lorg/eclipse/jgit/revwalk/RevObject;

    .line 322
    return-object p0
.end method

.method public setSigned(Z)Lorg/eclipse/jgit/api/TagCommand;
    .locals 0
    .parameter "signed"

    .prologue
    .line 283
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/TagCommand;->signed:Z

    .line 284
    return-object p0
.end method

.method public setTagger(Lorg/eclipse/jgit/lib/PersonIdent;)Lorg/eclipse/jgit/api/TagCommand;
    .locals 0
    .parameter "tagger"

    .prologue
    .line 295
    iput-object p1, p0, Lorg/eclipse/jgit/api/TagCommand;->tagger:Lorg/eclipse/jgit/lib/PersonIdent;

    .line 296
    return-object p0
.end method
