.class public interface abstract Lcom/jcraft/jsch/SftpProgressMonitor;
.super Ljava/lang/Object;
.source "SftpProgressMonitor.java"


# static fields
.field public static final GET:I = 0x1

.field public static final PUT:I = 0x0

.field public static final UNKNOWN_SIZE:J = -0x1L


# virtual methods
.method public abstract count(J)Z
.end method

.method public abstract end()V
.end method

.method public abstract init(ILjava/lang/String;Ljava/lang/String;J)V
.end method
