.class public abstract Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;
.super Ljava/lang/Object;
.source "WorkingTreeIterator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40c
    name = "Entry"
.end annotation


# instance fields
.field encodedName:[B

.field encodedNameLen:I


# direct methods
.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 1034
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method encodeName(Ljava/nio/charset/CharsetEncoder;)V
    .locals 7
    .parameter "enc"

    .prologue
    .line 1042
    :try_start_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/nio/CharBuffer;->wrap(Ljava/lang/CharSequence;)Ljava/nio/CharBuffer;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/nio/charset/CharsetEncoder;->encode(Ljava/nio/CharBuffer;)Ljava/nio/ByteBuffer;
    :try_end_0
    .catch Ljava/nio/charset/CharacterCodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 1049
    .local v0, b:Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v2

    iput v2, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;->encodedNameLen:I

    .line 1050
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->hasArray()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v2

    if-nez v2, :cond_0

    .line 1051
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    iput-object v2, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;->encodedName:[B

    .line 1054
    :goto_0
    return-void

    .line 1043
    .end local v0           #b:Ljava/nio/ByteBuffer;
    :catch_0
    move-exception v1

    .line 1045
    .local v1, e:Ljava/nio/charset/CharacterCodingException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->unencodeableFile:Ljava/lang/String;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;->getName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1053
    .end local v1           #e:Ljava/nio/charset/CharacterCodingException;
    .restart local v0       #b:Ljava/nio/ByteBuffer;
    :cond_0
    iget v2, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;->encodedNameLen:I

    new-array v2, v2, [B

    iput-object v2, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;->encodedName:[B

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    goto :goto_0
.end method

.method public abstract getLastModified()J
.end method

.method public abstract getLength()J
.end method

.method public abstract getMode()Lorg/eclipse/jgit/lib/FileMode;
.end method

.method public abstract getName()Ljava/lang/String;
.end method

.method public abstract openInputStream()Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1057
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;->getMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/FileMode;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$Entry;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
