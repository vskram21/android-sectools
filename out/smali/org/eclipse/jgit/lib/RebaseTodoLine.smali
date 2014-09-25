.class public Lorg/eclipse/jgit/lib/RebaseTodoLine;
.super Ljava/lang/Object;
.source "RebaseTodoLine.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;
    }
.end annotation


# instance fields
.field action:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

.field comment:Ljava/lang/String;

.field final commit:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

.field shortMessage:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .parameter "newComment"

    .prologue
    const/4 v1, 0x0

    .line 134
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 135
    sget-object v0, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->COMMENT:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    iput-object v0, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine;->action:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    .line 136
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/lib/RebaseTodoLine;->setComment(Ljava/lang/String;)V

    .line 137
    iput-object v1, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine;->commit:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    .line 138
    iput-object v1, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine;->shortMessage:Ljava/lang/String;

    .line 139
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;Lorg/eclipse/jgit/lib/AbbreviatedObjectId;Ljava/lang/String;)V
    .locals 1
    .parameter "action"
    .parameter "commit"
    .parameter "shortMessage"

    .prologue
    .line 149
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 150
    iput-object p1, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine;->action:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    .line 151
    iput-object p2, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine;->commit:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    .line 152
    iput-object p3, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine;->shortMessage:Ljava/lang/String;

    .line 153
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine;->comment:Ljava/lang/String;

    .line 154
    return-void
.end method

.method private static createInvalidCommentException(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;
    .locals 4
    .parameter "newComment"

    .prologue
    .line 227
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->argumentIsNotAValidCommentString:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public getAction()Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;
    .locals 1

    .prologue
    .line 160
    iget-object v0, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine;->action:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    return-object v0
.end method

.method public getComment()Ljava/lang/String;
    .locals 1

    .prologue
    .line 262
    iget-object v0, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine;->comment:Ljava/lang/String;

    return-object v0
.end method

.method public getCommit()Lorg/eclipse/jgit/lib/AbbreviatedObjectId;
    .locals 1

    .prologue
    .line 237
    iget-object v0, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine;->commit:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    return-object v0
.end method

.method public getShortMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 245
    iget-object v0, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine;->shortMessage:Ljava/lang/String;

    return-object v0
.end method

.method public setAction(Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;)V
    .locals 5
    .parameter "newAction"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/IllegalTodoFileModification;
        }
    .end annotation

    .prologue
    .line 175
    sget-object v0, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->COMMENT:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    iget-object v1, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine;->action:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    sget-object v0, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->COMMENT:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 177
    iget-object v0, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine;->comment:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 180
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "# "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine;->action:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    #getter for: Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->token:Ljava/lang/String;
    invoke-static {v1}, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->access$000(Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine;->commit:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    if-nez v0, :cond_1

    const-string v0, "null"

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine;->shortMessage:Ljava/lang/String;

    if-nez v0, :cond_2

    const-string v0, "null"

    :goto_1
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine;->comment:Ljava/lang/String;

    .line 190
    :cond_0
    iput-object p1, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine;->action:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    .line 191
    return-void

    .line 180
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine;->commit:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->name()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine;->shortMessage:Ljava/lang/String;

    goto :goto_1

    .line 183
    :cond_3
    sget-object v0, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->COMMENT:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    iget-object v1, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine;->action:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->COMMENT:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 185
    iget-object v0, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine;->commit:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    if-nez v0, :cond_0

    .line 186
    new-instance v0, Lorg/eclipse/jgit/errors/IllegalTodoFileModification;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->cannotChangeActionOnComment:Ljava/lang/String;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine;->action:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object p1, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/IllegalTodoFileModification;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setComment(Ljava/lang/String;)V
    .locals 1
    .parameter "newComment"

    .prologue
    .line 209
    if-nez p1, :cond_0

    .line 210
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine;->comment:Ljava/lang/String;

    .line 219
    :goto_0
    return-void

    .line 214
    :cond_0
    const-string v0, "\n"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "\r"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 215
    :cond_1
    invoke-static {p1}, Lorg/eclipse/jgit/lib/RebaseTodoLine;->createInvalidCommentException(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object v0

    throw v0

    .line 217
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "#"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 218
    :cond_3
    iput-object p1, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine;->comment:Ljava/lang/String;

    goto :goto_0

    .line 222
    :cond_4
    invoke-static {p1}, Lorg/eclipse/jgit/lib/RebaseTodoLine;->createInvalidCommentException(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object v0

    throw v0
.end method

.method public setShortMessage(Ljava/lang/String;)V
    .locals 0
    .parameter "shortMessage"

    .prologue
    .line 252
    iput-object p1, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine;->shortMessage:Ljava/lang/String;

    .line 253
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 268
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Step["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine;->action:Lorg/eclipse/jgit/lib/RebaseTodoLine$Action;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine;->commit:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    if-nez v0, :cond_0

    const-string v0, "null"

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine;->shortMessage:Ljava/lang/String;

    if-nez v0, :cond_1

    const-string v0, "null"

    :goto_1
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine;->comment:Ljava/lang/String;

    if-nez v0, :cond_2

    const-string v0, ""

    :goto_2
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine;->commit:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine;->shortMessage:Ljava/lang/String;

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lorg/eclipse/jgit/lib/RebaseTodoLine;->comment:Ljava/lang/String;

    goto :goto_2
.end method
