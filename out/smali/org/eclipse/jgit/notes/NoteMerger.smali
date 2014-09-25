.class public interface abstract Lorg/eclipse/jgit/notes/NoteMerger;
.super Ljava/lang/Object;
.source "NoteMerger.java"


# virtual methods
.method public abstract merge(Lorg/eclipse/jgit/notes/Note;Lorg/eclipse/jgit/notes/Note;Lorg/eclipse/jgit/notes/Note;Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/ObjectInserter;)Lorg/eclipse/jgit/notes/Note;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/notes/NotesMergeConflictException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method
