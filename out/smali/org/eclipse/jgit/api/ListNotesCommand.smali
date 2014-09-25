.class public Lorg/eclipse/jgit/api/ListNotesCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "ListNotesCommand.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/GitCommand",
        "<",
        "Ljava/util/List",
        "<",
        "Lorg/eclipse/jgit/notes/Note;",
        ">;>;"
    }
.end annotation


# instance fields
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

    iput-object v0, p0, Lorg/eclipse/jgit/api/ListNotesCommand;->notesRef:Ljava/lang/String;

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
    .line 66
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/ListNotesCommand;->call()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/notes/Note;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 81
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/ListNotesCommand;->checkCallable()V

    .line 82
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 83
    .local v3, notes:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/notes/Note;>;"
    new-instance v6, Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v7, p0, Lorg/eclipse/jgit/api/ListNotesCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v6, v7}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 84
    .local v6, walk:Lorg/eclipse/jgit/revwalk/RevWalk;
    invoke-static {}, Lorg/eclipse/jgit/notes/NoteMap;->newEmptyMap()Lorg/eclipse/jgit/notes/NoteMap;

    move-result-object v2

    .line 86
    .local v2, map:Lorg/eclipse/jgit/notes/NoteMap;
    :try_start_0
    iget-object v7, p0, Lorg/eclipse/jgit/api/ListNotesCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    iget-object v8, p0, Lorg/eclipse/jgit/api/ListNotesCommand;->notesRef:Ljava/lang/String;

    invoke-virtual {v7, v8}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v5

    .line 88
    .local v5, ref:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v5, :cond_0

    .line 89
    invoke-interface {v5}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v4

    .line 90
    .local v4, notesCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-virtual {v6}, Lorg/eclipse/jgit/revwalk/RevWalk;->getObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v7

    invoke-static {v7, v4}, Lorg/eclipse/jgit/notes/NoteMap;->read(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/revwalk/RevCommit;)Lorg/eclipse/jgit/notes/NoteMap;

    move-result-object v2

    .line 93
    .end local v4           #notesCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_0
    invoke-virtual {v2}, Lorg/eclipse/jgit/notes/NoteMap;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 94
    .local v1, i:Ljava/util/Iterator;,"Ljava/util/Iterator<Lorg/eclipse/jgit/notes/Note;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 95
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    invoke-interface {v3, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 96
    .end local v1           #i:Ljava/util/Iterator;,"Ljava/util/Iterator<Lorg/eclipse/jgit/notes/Note;>;"
    .end local v5           #ref:Lorg/eclipse/jgit/lib/Ref;
    :catch_0
    move-exception v0

    .line 97
    .local v0, e:Ljava/io/IOException;
    :try_start_1
    new-instance v7, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8, v0}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 99
    .end local v0           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v7

    invoke-virtual {v6}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    throw v7

    .restart local v1       #i:Ljava/util/Iterator;,"Ljava/util/Iterator<Lorg/eclipse/jgit/notes/Note;>;"
    .restart local v5       #ref:Lorg/eclipse/jgit/lib/Ref;
    :cond_1
    invoke-virtual {v6}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    .line 102
    return-object v3
.end method

.method public setNotesRef(Ljava/lang/String;)Lorg/eclipse/jgit/api/ListNotesCommand;
    .locals 0
    .parameter "notesRef"

    .prologue
    .line 115
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/ListNotesCommand;->checkCallable()V

    .line 116
    iput-object p1, p0, Lorg/eclipse/jgit/api/ListNotesCommand;->notesRef:Ljava/lang/String;

    .line 117
    return-object p0
.end method
