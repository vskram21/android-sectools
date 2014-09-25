.class Lorg/eclipse/jgit/util/io/ThrowingPrintWriter$1;
.super Ljava/lang/Object;
.source "ThrowingPrintWriter.java"

# interfaces
.implements Ljava/security/PrivilegedAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/util/io/ThrowingPrintWriter;-><init>(Ljava/io/Writer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/security/PrivilegedAction",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/util/io/ThrowingPrintWriter;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/util/io/ThrowingPrintWriter;)V
    .locals 0
    .parameter

    .prologue
    .line 71
    iput-object p1, p0, Lorg/eclipse/jgit/util/io/ThrowingPrintWriter$1;->this$0:Lorg/eclipse/jgit/util/io/ThrowingPrintWriter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic run()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 71
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/io/ThrowingPrintWriter$1;->run()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public run()Ljava/lang/String;
    .locals 2

    .prologue
    .line 73
    invoke-static {}, Lorg/eclipse/jgit/util/SystemReader;->getInstance()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v0

    const-string v1, "line.separator"

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/util/SystemReader;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
