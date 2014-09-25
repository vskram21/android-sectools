.class public Lorg/eclipse/jgit/util/io/ThrowingPrintWriter;
.super Ljava/io/Writer;
.source "ThrowingPrintWriter.java"


# instance fields
.field private final LF:Ljava/lang/String;

.field private final out:Ljava/io/Writer;


# direct methods
.method public constructor <init>(Ljava/io/Writer;)V
    .locals 1
    .parameter "out"

    .prologue
    .line 69
    invoke-direct {p0}, Ljava/io/Writer;-><init>()V

    .line 70
    iput-object p1, p0, Lorg/eclipse/jgit/util/io/ThrowingPrintWriter;->out:Ljava/io/Writer;

    .line 71
    new-instance v0, Lorg/eclipse/jgit/util/io/ThrowingPrintWriter$1;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/util/io/ThrowingPrintWriter$1;-><init>(Lorg/eclipse/jgit/util/io/ThrowingPrintWriter;)V

    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lorg/eclipse/jgit/util/io/ThrowingPrintWriter;->LF:Ljava/lang/String;

    .line 76
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 90
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/ThrowingPrintWriter;->out:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->close()V

    .line 91
    return-void
.end method

.method public flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 85
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/ThrowingPrintWriter;->out:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->flush()V

    .line 86
    return-void
.end method

.method public varargs format(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1
    .parameter "fmt"
    .parameter "args"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 161
    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/util/io/ThrowingPrintWriter;->print(Ljava/lang/Object;)V

    .line 162
    return-void
.end method

.method public print(C)V
    .locals 1
    .parameter "value"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 119
    invoke-static {p1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/util/io/ThrowingPrintWriter;->print(Ljava/lang/Object;)V

    .line 120
    return-void
.end method

.method public print(I)V
    .locals 1
    .parameter "value"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 129
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/util/io/ThrowingPrintWriter;->print(Ljava/lang/Object;)V

    .line 130
    return-void
.end method

.method public print(J)V
    .locals 1
    .parameter "value"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 139
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/util/io/ThrowingPrintWriter;->print(Ljava/lang/Object;)V

    .line 140
    return-void
.end method

.method public print(Ljava/lang/Object;)V
    .locals 2
    .parameter "any"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 171
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/ThrowingPrintWriter;->out:Ljava/io/Writer;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 172
    return-void
.end method

.method public print(S)V
    .locals 1
    .parameter "value"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 149
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/util/io/ThrowingPrintWriter;->print(Ljava/lang/Object;)V

    .line 150
    return-void
.end method

.method public println()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 109
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/ThrowingPrintWriter;->LF:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/util/io/ThrowingPrintWriter;->print(Ljava/lang/Object;)V

    .line 110
    return-void
.end method

.method public println(Ljava/lang/String;)V
    .locals 2
    .parameter "s"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 100
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/util/io/ThrowingPrintWriter;->LF:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/util/io/ThrowingPrintWriter;->print(Ljava/lang/Object;)V

    .line 101
    return-void
.end method

.method public write([CII)V
    .locals 1
    .parameter "cbuf"
    .parameter "off"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 80
    iget-object v0, p0, Lorg/eclipse/jgit/util/io/ThrowingPrintWriter;->out:Ljava/io/Writer;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/Writer;->write([CII)V

    .line 81
    return-void
.end method
