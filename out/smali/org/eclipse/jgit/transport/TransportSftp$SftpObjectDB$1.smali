.class Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB$1;
.super Ljava/lang/Object;
.source "TransportSftp.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;->getPackNames()Ljava/util/Collection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;

.field final synthetic val$mtimes:Ljava/util/HashMap;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;Ljava/util/HashMap;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 249
    iput-object p1, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB$1;->this$1:Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB;

    iput-object p2, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB$1;->val$mtimes:Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 249
    check-cast p1, Ljava/lang/String;

    .end local p1
    check-cast p2, Ljava/lang/String;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB$1;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public compare(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .parameter "o1"
    .parameter "o2"

    .prologue
    .line 251
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB$1;->val$mtimes:Ljava/util/HashMap;

    invoke-virtual {v0, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransportSftp$SftpObjectDB$1;->val$mtimes:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    sub-int v0, v1, v0

    return v0
.end method
