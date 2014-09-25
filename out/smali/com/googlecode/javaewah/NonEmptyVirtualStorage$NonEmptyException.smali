.class Lcom/googlecode/javaewah/NonEmptyVirtualStorage$NonEmptyException;
.super Ljava/lang/RuntimeException;
.source "NonEmptyVirtualStorage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/googlecode/javaewah/NonEmptyVirtualStorage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "NonEmptyException"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    return-void
.end method


# virtual methods
.method public declared-synchronized fillInStackTrace()Ljava/lang/Throwable;
    .locals 0

    .prologue
    .line 29
    monitor-enter p0

    monitor-exit p0

    return-object p0
.end method
