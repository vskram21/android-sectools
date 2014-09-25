.class Lorg/eclipse/jgit/util/SystemReader$2;
.super Ljava/lang/Object;
.source "SystemReader.java"

# interfaces
.implements Ljava/security/PrivilegedAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/util/SystemReader;->isWindows()Z
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
.field final synthetic this$0:Lorg/eclipse/jgit/util/SystemReader;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/util/SystemReader;)V
    .locals 0
    .parameter

    .prologue
    .line 268
    iput-object p1, p0, Lorg/eclipse/jgit/util/SystemReader$2;->this$0:Lorg/eclipse/jgit/util/SystemReader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic run()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 268
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/SystemReader$2;->run()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public run()Ljava/lang/String;
    .locals 2

    .prologue
    .line 270
    iget-object v0, p0, Lorg/eclipse/jgit/util/SystemReader$2;->this$0:Lorg/eclipse/jgit/util/SystemReader;

    const-string v1, "os.name"

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/util/SystemReader;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
