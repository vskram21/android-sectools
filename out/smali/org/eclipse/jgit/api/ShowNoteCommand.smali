.class public Lorg/eclipse/jgit/api/ShowNoteCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "ShowNoteCommand.java"


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
    .line 74
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/GitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 68
    const-string v0, "refs/notes/commits"

    iput-object v0, p0, Lorg/eclipse/jgit/api/ShowNoteCommand;->notesRef:Ljava/lang/String;

    .line 75
    return-void
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
    .line 64
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/ShowNoteCommand;->call()Lorg/eclipse/jgit/notes/Note;

    move-result-object v0

    return-object v0
.end method

.method public call()Lorg/eclipse/jgit/notes/Note;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 78
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/ShowNoteCommand;->checkCallable()V

    .line 79
    new-instance v4, Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v5, p0, Lorg/eclipse/jgit/api/ShowNoteCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v4, v5}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 80
    .local v4, walk:Lorg/eclipse/jgit/revwalk/RevWalk;
    invoke-static {}, Lorg/eclipse/jgit/notes/NoteMap;->newEmptyMap()Lorg/eclipse/jgit/notes/NoteMap;

    move-result-object v1

    .line 81
    .local v1, map:Lorg/eclipse/jgit/notes/NoteMap;
    const/4 v2, 0x0

    .line 83
    .local v2, notesCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    :try_start_0
    iget-object v5, p0, Lorg/eclipse/jgit/api/ShowNoteCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    iget-object v6, p0, Lorg/eclipse/jgit/api/ShowNoteCommand;->notesRef:Ljava/lang/String;

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v3

    .line 85
    .local v3, ref:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v3, :cond_0

    .line 86
    invoke-interface {v3}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v2

    .line 87
    invoke-virtual {v4}, Lorg/eclipse/jgit/revwalk/RevWalk;->getObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v5

    invoke-static {v5, v2}, Lorg/eclipse/jgit/notes/NoteMap;->read(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/revwalk/RevCommit;)Lorg/eclipse/jgit/notes/NoteMap;

    move-result-object v1

    .line 89
    :cond_0
    iget-object v5, p0, Lorg/eclipse/jgit/api/ShowNoteCommand;->id:Lorg/eclipse/jgit/revwalk/RevObject;

    invoke-virtual {v1, v5}, Lorg/eclipse/jgit/notes/NoteMap;->getNote(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/notes/Note;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 93
    invoke-virtual {v4}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    return-object v5

    .line 90
    .end local v3           #ref:Lorg/eclipse/jgit/lib/Ref;
    :catch_0
    move-exception v0

    .line 91
    .local v0, e:Ljava/io/IOException;
    :try_start_1
    new-instance v5, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v0}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 93
    .end local v0           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v5

    invoke-virtual {v4}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    throw v5
.end method

.method public setNotesRef(Ljava/lang/String;)Lorg/eclipse/jgit/api/ShowNoteCommand;
    .locals 0
    .parameter "notesRef"

    .prologue
    .line 119
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/ShowNoteCommand;->checkCallable()V

    .line 120
    iput-object p1, p0, Lorg/eclipse/jgit/api/ShowNoteCommand;->notesRef:Ljava/lang/String;

    .line 121
    return-object p0
.end method

.method public setObjectId(Lorg/eclipse/jgit/revwalk/RevObject;)Lorg/eclipse/jgit/api/ShowNoteCommand;
    .locals 0
    .parameter "id"

    .prologue
    .line 104
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/ShowNoteCommand;->checkCallable()V

    .line 105
    iput-object p1, p0, Lorg/eclipse/jgit/api/ShowNoteCommand;->id:Lorg/eclipse/jgit/revwalk/RevObject;

    .line 106
    return-object p0
.end method
