#PBS -N name
### Set the number of nodes that will be used. Ensure
### that the number "nodes" matches with the need of your job
### DO NOT MODIFY THE FOLLOWING LINE FOR SINGLE-PROCESSOR JOBS!
#PBS -l nodes=1:ppn=1
#PBS -l walltime=240:00:00
#PBS -q verylong
###PBS -M zhaoyj@scut.edu.cn
#PBS -m abe
export NPROCS=`wc -l $PBS_NODEFILE |gawk '//{print $1}'`
echo $NPROCS
echo The master node of this job is `hostname`
echo The working directory is `echo $PBS_O_WORKDIR`
echo The node file is $PBS_NODEFILE
echo This job runs on the following $NPROCS nodes:
echo `cat $PBS_NODEFILE`
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo
echo command to EXE:
echo
echo
cd $PBS_O_WORKDIR

date
mpiexec /home/bin/dftb+ > "$PBS_JOBID".out
date

