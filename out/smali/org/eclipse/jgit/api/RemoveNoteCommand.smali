.class public Lorg/eclipse/jgit/api/RemoveNoteCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "RemoveNoteCommand.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/GitCommand",
        "<",
        "Lorg/eclipse/jgit/notes/Note;",
        ">;"
    }
.end annotation


# instance fields
.field private id:Lorg/eclipse/jgit/revwalk/RevObject;

.field private notesRef:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "repo"

    .prologue
    .line 79
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/GitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 73
    const-string v0, "refs/notes/commits"

    iput-object v0, p0, Lorg/eclipse/jgit/api/RemoveNoteCommand;->notesRef:Ljava/lang/String;

    .line 80
    return-void
.end method

.method private commitNoteMap(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/notes/NoteMap;Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/lib/ObjectInserter;Ljava/lang/String;)V
    .locals 5
    .parameter "walk"
    .parameter "map"
    .parameter "notesCommit"
    .parameter "inserter"
    .parameter "msg"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 125
    new-instance v0, Lorg/eclipse/jgit/lib/CommitBuilder;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/CommitBuilder;-><init>()V

    .line 126
    .local v0, builder:Lorg/eclipse/jgit/lib/CommitBuilder;
    invoke-virtual {p2, p4}, Lorg/eclipse/jgit/notes/NoteMap;->writeTree(Lorg/eclipse/jgit/lib/ObjectInserter;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/eclipse/jgit/lib/CommitBuilder;->setTreeId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 127
    new-instance v3, Lorg/eclipse/jgit/lib/PersonIdent;

    iget-object v4, p0, Lorg/eclipse/jgit/api/RemoveNoteCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/lib/PersonIdent;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    invoke-virtual {v0, v3}, Lorg/eclipse/jgit/lib/CommitBuilder;->setAuthor(Lorg/eclipse/jgit/lib/PersonIdent;)V

    .line 128
    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/CommitBuilder;->getAuthor()Lorg/eclipse/jgit/lib/PersonIdent;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/eclipse/jgit/lib/CommitBuilder;->setCommitter(Lorg/eclipse/jgit/lib/PersonIdent;)V

    .line 129
    invoke-virtual {v0, p5}, Lorg/eclipse/jgit/lib/CommitBuilder;->setMessage(Ljava/lang/String;)V

    .line 130
    if-eqz p3, :cond_0

    .line 131
    const/4 v3, 0x1

    new-array v3, v3, [Lorg/eclipse/jgit/lib/ObjectId;

    const/4 v4, 0x0

    aput-object p3, v3, v4

    invoke-virtual {v0, v3}, Lorg/eclipse/jgit/lib/CommitBuilder;->setParentIds([Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 132
    :cond_0
    invoke-virtual {p4, v0}, Lorg/eclipse/jgit/lib/ObjectInserter;->insert(Lorg/eclipse/jgit/lib/CommitBuilder;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    .line 133
    .local v1, commit:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-virtual {p4}, Lorg/eclipse/jgit/lib/ObjectInserter;->flush()V

    .line 134
    iget-object v3, p0, Lorg/eclipse/jgit/api/RemoveNoteCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    iget-object v4, p0, Lorg/eclipse/jgit/api/RemoveNoteCommand;->notesRef:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/lib/Repository;->updateRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefUpdate;

    move-result-object v2

    .line 135
    .local v2, refUpdate:Lorg/eclipse/jgit/lib/RefUpdate;
    if-eqz p3, :cond_1

    .line 136
    invoke-virtual {v2, p3}, Lorg/eclipse/jgit/lib/RefUpdate;->setExpectedOldObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 139
    :goto_0
    invoke-virtual {v2, v1}, Lorg/eclipse/jgit/lib/RefUpdate;->setNewObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 140
    invoke-virtual {v2, p1}, Lorg/eclipse/jgit/lib/RefUpdate;->update(Lorg/eclipse/jgit/revwalk/RevWalk;)Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 141
    return-void

    .line 138
    :cond_1
    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/lib/RefUpdate;->setExpectedOldObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    goto :goto_0
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
    .line 69
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/RemoveNoteCommand;->call()Lorg/eclipse/jgit/notes/Note;

    move-result-object v0

    return-object v0
.end method

.method public call()Lorg/eclipse/jgit/notes/Note;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 83
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/RemoveNoteCommand;->checkCallable()V

    .line 84
    new-instance v1, Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v0, p0, Lorg/eclipse/jgit/api/RemoveNoteCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v1, v0}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 85
    .local v1, walk:Lorg/eclipse/jgit/revwalk/RevWalk;
    iget-object v0, p0, Lorg/eclipse/jgit/api/RemoveNoteCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/Repository;->newObjectInserter()Lorg/eclipse/jgit/lib/ObjectInserter;

    move-result-object v4

    .line 86
    .local v4, inserter:Lorg/eclipse/jgit/lib/ObjectInserter;
    invoke-static {}, Lorg/eclipse/jgit/notes/NoteMap;->newEmptyMap()Lorg/eclipse/jgit/notes/NoteMap;

    move-result-object v2

    .line 87
    .local v2, map:Lorg/eclipse/jgit/notes/NoteMap;
    const/4 v3, 0x0

    .line 89
    .local v3, notesCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/api/RemoveNoteCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    iget-object v5, p0, Lorg/eclipse/jgit/api/RemoveNoteCommand;->notesRef:Ljava/lang/String;

    invoke-virtual {v0, v5}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v7

    .line 91
    .local v7, ref:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v7, :cond_0

    .line 92
    invoke-interface {v7}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v3

    .line 93
    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->getObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v0

    invoke-static {v0, v3}, Lorg/eclipse/jgit/notes/NoteMap;->read(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/revwalk/RevCommit;)Lorg/eclipse/jgit/notes/NoteMap;

    move-result-object v2

    .line 95
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/api/RemoveNoteCommand;->id:Lorg/eclipse/jgit/revwalk/RevObject;

    const/4 v5, 0x0

    invoke-virtual {v2, v0, v5, v4}, Lorg/eclipse/jgit/notes/NoteMap;->set(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectInserter;)V

    .line 96
    const-string v5, "Notes removed by \'git notes remove\'"

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/api/RemoveNoteCommand;->commitNoteMap(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/notes/NoteMap;Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/lib/ObjectInserter;Ljava/lang/String;)V

    .line 98
    iget-object v0, p0, Lorg/eclipse/jgit/api/RemoveNoteCommand;->id:Lorg/eclipse/jgit/revwalk/RevObject;

    invoke-virtual {v2, v0}, Lorg/eclipse/jgit/notes/NoteMap;->getNote(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/notes/Note;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 102
    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/ObjectInserter;->release()V

    .line 103
    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    return-object v0

    .line 99
    .end local v7           #ref:Lorg/eclipse/jgit/lib/Ref;
    :catch_0
    move-exception v6

    .line 100
    .local v6, e:Ljava/io/IOException;
    :try_start_1
    new-instance v0, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v6}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v5, v6}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 102
    .end local v6           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v0

    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/ObjectInserter;->release()V

    .line 103
    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    throw v0
.end method

.method public setNotesRef(Ljava/lang/String;)Lorg/eclipse/jgit/api/RemoveNoteCommand;
    .locals 0
    .parameter "notesRef"

    .prologue
    .line 153
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/RemoveNoteCommand;->checkCallable()V

    .line 154
    iput-object p1, p0, Lorg/eclipse/jgit/api/RemoveNoteCommand;->notesRef:Ljava/lang/String;

    .line 155
    return-object p0
.end method

.method public setObjectId(Lorg/eclipse/jgit/revwalk/RevObject;)Lorg/eclipse/jgit/api/RemoveNoteCommand;
    .locals 0
    .parameter "id"

    .prologue
    .line 114
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/RemoveNoteCommand;->checkCallable()V

    .line 115
    iput-object p1, p0, Lorg/eclipse/jgit/api/RemoveNoteCommand;->id:Lorg/eclipse/jgit/revwalk/RevObject;

    .line 116
    return-object p0
.end method
