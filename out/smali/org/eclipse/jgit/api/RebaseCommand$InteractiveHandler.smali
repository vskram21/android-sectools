.class public interface abstract Lorg/eclipse/jgit/api/RebaseCommand$InteractiveHandler;
.super Ljava/lang/Object;
.source "RebaseCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/api/RebaseCommand;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "InteractiveHandler"
.end annotation


# virtual methods
.method public abstract modifyCommitMessage(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract prepareSteps(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/RebaseTodoLine;",
            ">;)V"
        }
    .end annotation
.end method
